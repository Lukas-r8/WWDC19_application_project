//
//  extension1_4.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 24/03/2019.
//

import Foundation
import UIKit
import simd


// Helper functions
extension LiveViewController_1_4 {
    @objc func handleAnimation(loop: CADisplayLink){
        for (index,i) in shootingStars.enumerated() {
            
            if !star.checkIfMerged(i) {
                i.enableUpdateAfter(Double(index))
                let force = star.attract(i) * 0.1
                i.applyForce(force)
                i.update()
            } else {
                if !i.hasMergedOnce {
                    star.addMass(i.mass)
                    star.shake(10)
                    i.hasMergedOnce = true
                    i.alpha = 0
                    
                    let multiplierBar = CGFloat(star.SchwarzschildRadius) / star.radius
                    schwarzschildInfo.updateMultiplier(multiplierBar)
                schwarzschildInfo.createLabelForInfoLabel(Double(star.SchwarzschildRadius), star.radius)
                    
                    switch multiplierBar {
                    case _ where multiplierBar < 0.3:
                        info.createAdjustedStr("That's a light star, try adding more solar masses to see what happens.", 1)
                    case _ where multiplierBar <= 0.3 || multiplierBar < 0.5:
                        info.createAdjustedStr("That's a star with medium mass still nothing to worry about.", 1)
                    case _ where multiplierBar <= 0.5 || multiplierBar < 1:
                        info.createAdjustedStr("That's a very heavy star if you keep adding mass something weird could happen.", 1)
                    case _ where multiplierBar >= 1:
                        info.createAdjustedStr("That's a black hole, it means that this object is infinetely dense and it has a very strong gravitational force so that so that not even light could escape its gravity, the point from where \"No way back\" starts is called event horizon by physicists.", 1)
                    default:
                        break
                    }
                }
                
            }
        }
        
  
        
    }
    
    
    @objc func resetPage(){
        animationLoop.isPaused = true
        view.subviews.forEach { (v) in
            if v.tag == -1 {
                UIView.animate(withDuration: 0.5, animations: {
                    v.alpha = 0
                }, completion: { (suc) in
                    v.removeFromSuperview()
                })
            }
        }
    }
    
    
    func setUpViewsAndConstraints(){
        view.addMultSubView(milkWayCanvas, star, schwarzschildInfo , info)
        
        milkWayCanvas.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        milkWayCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        milkWayCanvas.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        milkWayCanvas.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        schwarzschildInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        schwarzschildInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        schwarzschildInfo.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        schwarzschildInfo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        info.topAnchor.constraint(equalTo: schwarzschildInfo.bottomAnchor, constant: 5).isActive = true
        info.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        info.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        info.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
    }
    
    func createShootingStars(_ numberOfStars: Int) -> [BodyView] {
        var stars = [BodyView]()
        let strideValue = numberOfStars > 20 || numberOfStars < 1 ? 2 : numberOfStars
        let angle = Float(360 / strideValue)
        var stridedAngles = Array(stride(from: Float(0), to: Float(360), by: angle))
        for i in 0 ..< numberOfStars {
            let newStar = BodyView(Attributes(name: .sun, mass: 5000, texture: #imageLiteral(resourceName: "sun"), diameter: 50, acceleration: .zero, position: .zero, velocity: .zero))
            newStar.updatePosition(getSorroudingsPoints(star, newStar, degree: stridedAngles[i]))
            newStar.isUpdatingEnabled = false
            newStar.tag = -1
            stars.append(newStar)
        }
        return stars
    }
    
    func addShootingStarsToView(_ numberToAdd: Int){
        shootingStars = createShootingStars(numberToAdd)
        for viewB in shootingStars {
            viewB.alpha = 0
            view.addSubview(viewB)
            UIView.animate(withDuration: 0.5) {
                viewB.alpha = 1
            }
        }
        view.bringSubviewToFront(star)
    }
    
    func getSorroudingsPoints(_ body: BodyView, _ body2: BodyView, degree: Float) -> float2{
        let radians = degree * .pi / 180
        let x = body.pos.x + Float(body.radius + body2.radius + 100) * cos(radians)
        let y = body.pos.y + Float(body.radius + body2.radius + 100) * sin(radians)
        return float2(x,y)
    }
    
    
}
