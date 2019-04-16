//
//  File.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 23/03/2019.
//

import UIKit
import Foundation
import PlaygroundSupport
import simd

public class LiveViewController_1_4: LiveViewController {
   
    let milkWayCanvas: UIImageView = {
        let canvas = UIImageView(image: UIImage(named: "stars_milky_way"))
        canvas.translatesAutoresizingMaskIntoConstraints = false
        return canvas
    }()
    
    let star = BodyView(Attributes(name: .sun, mass: 10000, texture: #imageLiteral(resourceName: "sun"), diameter: 250, acceleration: .zero, position: float2(0, 100), velocity: .zero))
    
    var shootingStars = [BodyView]()

    lazy var animationLoop: CADisplayLink = {
        let loop = CADisplayLink(target: self, selector: #selector(handleAnimation))
        loop.add(to: .current, forMode: .common)
        return loop
    }()
    
    let info: infoLabel = {
        let label = infoLabel()
        label.text = nil
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    let schwarzschildInfo = SchwarzschildBar()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        animationLoop.isPaused = true
        schwarzschildInfo.updateMultiplier(0.1)
        setUpViewsAndConstraints()
    }
    
 
 
 
    
    override public func receive(_ message: PlaygroundValue) {
        
        if case PlaygroundValue.integer(let numData) = message {
            resetPage()
            addShootingStarsToView(numData)
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (tim) in
                self.animationLoop.isPaused = !self.animationLoop.isPaused
                tim.invalidate()
            }
        }
        
    }
    
}
