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

public class LiveViewController_1_3: LiveViewController {
    var firstLoop = true
    var totalLenght: CGFloat = 0
    var prevPoint = CGPoint.zero
    
    var currHighPosition: Double = 0 {
        didSet{
            if currHighPosition > oldValue {
                hightLabel.text = "Highest height: \(oldValue.roundTo(2))"
            }
        }
    }
    
    var initialY: Double = 0
 
    
    let milkWayCanvas: UIImageView = {
        let canvas = UIImageView(image: UIImage(named: "stars_milky_way"))
        canvas.translatesAutoresizingMaskIntoConstraints = false
        return canvas
    }()
    
    let planet = BodyView(Attributes(name: BodiesName.jupiter, mass: 100000, texture: #imageLiteral(resourceName: "jupiter"), diameter: 600, acceleration: .zero, position: float2(0, 500), velocity: .zero))
   
    
    let projectile = BodyView(Attributes(name: .metalBall, mass: 10, texture: #imageLiteral(resourceName: "projectileBall"), diameter: 50, acceleration: .zero, position: float2(0, 0), velocity: float2(-5.2, -15)))
    
    
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
    
    var orbitPath = CGMutablePath()
    
    
    lazy var animationLoop: CADisplayLink = {
        let loop = CADisplayLink(target: self, selector: #selector(handleAnimation))
        loop.add(to: .current, forMode: .common)
        return loop
    }()
    
    
    let showLabel: infoLabel = {
        let label = infoLabel()
        label.text = ""
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    let hightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Highest height: 0"
        label.textColor = .white
        return label
    }()
    
   
    override public func viewDidLoad() {
        super.viewDidLoad()
        animationLoop.isPaused = true
        setUpViews()
    }
    

    
    override public func receive(_ message: PlaygroundValue) {
        if case PlaygroundValue.integer(let n) = message {
            guard let initVelocEnum = commandInitialVelocity(rawValue: n) else {return}
            var velocity = float2(0,0)

            
            switch initVelocEnum {
                case .veryLow:
                    velocity = initialVelocityValues.veryLow
                    showLabel.createAdjustedStr("The ball barely left the ground, try to increase the initial velocity.")
                case .low:
                    velocity = initialVelocityValues.low
                    showLabel.createAdjustedStr("Better than low velocity but still too slow.")
                case .medium:
                    velocity = initialVelocityValues.medium
                    showLabel.createAdjustedStr("Good throw try adding more velocity.")
                case .high:
                    velocity = initialVelocityValues.high
                    showLabel.createAdjustedStr("It was a good throw, but still not enough velocity, gravity still can decelerate the ball and bring it back!")
                case .veryHigh:
                    velocity = initialVelocityValues.veryHigh
                    showLabel.createAdjustedStr("Great throw!! It was super fast I can barely see where the ball is heading to.\n This ball will never come back unless someone bring it back, you reached the escape velocity of this planet!")
            }
            resetPage()
            projectile.velocity = velocity
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (tim) in
                self.animationLoop.isPaused = false
                tim.invalidate()
            }
            
        }
    }

}
