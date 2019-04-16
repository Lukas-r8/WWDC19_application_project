//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import Foundation
import PlaygroundSupport
import simd

public class LiveViewController_1_1: LiveViewController {
    // stored properties
    var velocity = Velocity.low
    var firstLoop = true
    var totalLenght: CGFloat = 0
    var prevPoint = CGPoint.zero
    var getAllPlanets: [BodyView] {return [sun, earth]}
    var elipsePath = CGMutablePath()

    //views
    let sun = BodyView(Attributes(name: .sun, mass: 10000, texture: #imageLiteral(resourceName: "sun"), diameter: 100, acceleration: .zero, position: float2(0,-150), velocity: .zero))
    lazy var earth = BodyView(Attributes(name: .earth, mass: 10, texture: #imageLiteral(resourceName: "earth"), diameter: 40, acceleration: .zero, position: float2(0, -300), velocity: velocity))
    
    let milkWayCanvas: UIImageView = {
        let canvas = UIImageView(image: UIImage(named: "stars_milky_way"))
        canvas.translatesAutoresizingMaskIntoConstraints = false
        return canvas
    }()
    
    lazy var animationLoop: CADisplayLink = {
        let display = CADisplayLink(target: self, selector: #selector(loopHandler))
        display.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
        return display
    }()
    
    let drawCanvas: UIView = {
        let canvas = UIView()
        canvas.backgroundColor = .clear
        canvas.translatesAutoresizingMaskIntoConstraints = false
        return canvas
    }()
    
    let orbitShape: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.lineCap = CAShapeLayerLineCap.round
        shape.fillColor = nil
        shape.lineWidth = 2
        shape.strokeColor = UIColor.white.cgColor
        return shape
    }()
    
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Orbits"
        return label
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        animationLoop.isPaused = true
        setUpViews()
    }
    
  
    
     override public func receive(_ message: PlaygroundValue) {
        
        if case PlaygroundValue.integer(let number) = message {
            var labelValue: String?
            if number == 0 {
                velocity = Velocity.low
                labelValue = "Spiral Orbit"
            } else  if number == 1 {
                velocity = Velocity.moderate
                labelValue = "Circular Orbit"
            } else if number == 2 {
                velocity = Velocity.normal
                labelValue = "Elliptical Orbit"
            } else if number == 3 {
                velocity = Velocity.veryHigh
                labelValue = "Hyperbolic Orbit"
            }
            
            resetOrbit()
            infoLabel.text = labelValue
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
                self.startLoop()
                timer.invalidate()
            }
 
        }
    }
}


