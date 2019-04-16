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

public class LiveViewController_1_2: LiveViewController {
    let milkWayCanvas: UIImageView = {
        let canvas = UIImageView(image: UIImage(named: "stars_milky_way"))
        canvas.translatesAutoresizingMaskIntoConstraints = false
        return canvas
    }()
    
    lazy var planet = BodyView(Attributes(name: .venus, mass: 400000, texture: #imageLiteral(resourceName: "venus"), diameter: view.frame.width, acceleration: .zero, position: float2(0, Float(view.frame.height / 1.2)), velocity: .zero))
    
    lazy var person = Person(Attributes(name: .person, mass: 80, texture: #imageLiteral(resourceName: "personSign"), diameter: 200, acceleration: .zero, position: float2(0, -Float(view.frame.height / 2) + 110), velocity: .zero))
    
    
    let info = infoLabel()
    
    lazy var animationLoop: CADisplayLink = {
        let loop = CADisplayLink(target: self, selector: #selector(handleLoop))
        loop.add(to: .current, forMode: .common)
        return loop
    }()
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        animationLoop.isPaused = true
        setUpViews()
    }
    
    override public func receive(_ message: PlaygroundValue) {
     
        if case PlaygroundValue.data(let d) = message {
            guard let data = NSKeyedUnarchiver.unarchiveObject(with: d) as? [String: Any] else {return}
            guard let mass = data["mass"] as? Double else {return}
            guard let planetOption = data["planet"] as? String else {return}
            guard let planet = PlanetsOption(rawValue: planetOption) else {return}
            
            var acc: Double = 9.8
            var planetMass: String = ""
            
            
            switch planet {
            case .earth:
                planetMass = PlanetsMass.earth
                acc = AccelerationRate.earth
                self.planet.mass = 200000
            case .jupiter:
                planetMass = PlanetsMass.jupiter
                acc = AccelerationRate.jupiter
                self.planet.mass = 400000
            case .mars:
                planetMass = PlanetsMass.mars
                acc = AccelerationRate.mars
                self.planet.mass = 69000
            case .venus:
                planetMass = PlanetsMass.venus
                acc = AccelerationRate.venus
                self.planet.mass = 180000
            case .moon:
                planetMass = PlanetsMass.moon
                acc = AccelerationRate.moon
                self.planet.mass = 20000
            }
            
            let weight = acc * mass
            let equivalent = acc / 9.8 * mass

            self.planet.textureView.image = UIImage(named: planet.rawValue)
            
            info.createMassInfoString(mass.roundTo(), weight.roundTo() ,planet.rawValue, acc, planetMass, equivalent.roundTo())
            person.massLabel.text = "\(mass.roundTo())Kg"
            resetPage()
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (tim) in
                self.animationLoop.isPaused = false
                
                
                tim.invalidate()
            }
            

        }
        
   

    }
}
