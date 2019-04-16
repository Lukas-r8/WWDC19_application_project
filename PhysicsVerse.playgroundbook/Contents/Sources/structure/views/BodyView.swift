//
//  BodyView.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 20/03/2019.
//

import Foundation
import UIKit
import simd

class BodyView: UIView {
    var name: String
    var mass: Float
    var diameter: CGFloat
    var acc: simd_float2
    var velocity: simd_float2
    var pos: simd_float2
    var texture: UIImage?
    var isUpdatingEnabled = true

    var hasMergedOnce = false
    lazy var totalMass = mass
    private var isABlackHole = false
    
    var SchwarzschildRadius: Float {
        get {
            return 2 * constants.G * totalMass / (constants.c * constants.c)
        }
    }
    
    var radius: CGFloat {return diameter / 2 }
    
    var drag = false {
        didSet{
            dragForce = drag ? 0.999 : 1
        }
    }
    
    private var dragForce: Float = 1
    
    
    
    let textureView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = UIView.ContentMode.scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    required init(_ attr: Attributes) {
        mass = attr.mass
        diameter = attr.diameter
        acc = attr.acceleration
        pos = attr.position
        velocity = attr.velocity
        name = attr.name.rawValue
        texture = attr.texture
        super.init(frame: .zero)
        setUpPlanet()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shake(_ force: CGFloat = 5){
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = center.x - force
        animation.toValue = center.x + force
        animation.duration = 0.1
        animation.repeatCount = 5
        animation.autoreverses = true
        layer.add(animation, forKey: nil)
    }
    
    
    func addMass(_ massToAdd: Float){
        totalMass += massToAdd
        
        checkIfPassedCriticalMass()
    }
    func checkIfPassedCriticalMass(){
        
        if SchwarzschildRadius > Float(radius) {
            becomeABlackHole()
        }
    }
    
    func becomeABlackHole(){
        if !isABlackHole {
            UIView.animate(withDuration: 0.5, animations: {
                self.alpha = 0
            }) { (s) in
                self.textureView.image = #imageLiteral(resourceName: "blackHole")
                UIView.animate(withDuration: 0.3, animations: {
                    self.alpha = 1
                })
            }
            isABlackHole = true
            isUserInteractionEnabled = false
        }
    }
    
    func  setUpPlanet(){
        let size = CGSize(width: diameter, height: diameter)
        frame.size = size
        layer.cornerRadius = diameter / 2
        center = CGPoint.fromVector(pos).adj()
        
        addSubview(textureView)
        textureView.frame.origin = bounds.origin
        textureView.frame.size = bounds.size
        textureView.image = texture
        textureView.layer.cornerRadius = diameter / 2
    }
    
 
    
    func updatePosition(_ position: float2){
        pos = position
        center = CGPoint.fromVector(pos).adj()
    }
    
    func enableUpdateAfter(_ t: TimeInterval){
        if !isUpdatingEnabled {
            Timer.scheduledTimer(withTimeInterval: t, repeats: false) { (tim) in
                self.isUpdatingEnabled = true
                tim.invalidate()
            }
        }
    }
    
    func update(){
        if isUpdatingEnabled {
            velocity += acc
            pos += velocity
            velocity *= dragForce
            center = CGPoint.fromVector(pos).adj()
        }
        acc = simd_float2()
    }
    
    func attract(_ otherPlanet: BodyView) -> simd_float2{
        let forceDirection = simd_normalize(self.pos - otherPlanet.pos)
        let dist = simd_length(self.pos - otherPlanet.pos)
        if dist == 0 {return simd_float2()}
        let G = constants.G
        let gravForce = ((G * mass * otherPlanet.mass) / (dist * dist)) * forceDirection
        return gravForce
    }
    
    func applyForce(_ force: simd_float2){
        let acceleration = force / mass
        acc += acceleration
    }
    
    func checkIfMerged(_ body1: BodyView) -> Bool {
        let deltaX = self.center.x - body1.center.x
        let deltaY = self.center.y - body1.center.y
        let centerDistance = sqrt(deltaX * deltaX + deltaY * deltaY)
        let minDistanceBeforeMerge = self.radius - body1.radius - 10
        return centerDistance < minDistanceBeforeMerge
    }
    
    func checkCollision(_ body1: BodyView) -> Bool {
        let deltaX = self.center.x - body1.center.x
        let deltaY = self.center.y - body1.center.y
        let centerDistance = sqrt(deltaX * deltaX + deltaY * deltaY)
        let minDistanceBeforeCollision = self.diameter / 2 + body1.diameter / 2
        return centerDistance < minDistanceBeforeCollision
    }
    
    func bounce(){
        velocity = velocity * -0.89
    }
    
   
}
