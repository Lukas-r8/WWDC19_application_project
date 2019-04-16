//
//  extension1_3.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 24/03/2019.
//

import Foundation
import UIKit
import simd


// helper functions
extension LiveViewController_1_3 {
    
    @objc func resetPage(){
        animationLoop.isPaused = true
        
        firstLoop = true
        totalLenght = 0
        
        initialY = 0
        
        UIView.animate(withDuration: 1) {
            self.projectile.updatePosition(self.getTouchingPoint(self.planet, self.projectile, degree: -145))
        }
        
        prevPoint = projectile.center
        orbitPath = CGMutablePath()
        orbitShape.path = orbitPath
    }
    
    
    public func setUpViews(){
        view.addMultSubView(milkWayCanvas, drawCanvas, showLabel, hightLabel ,planet, projectile)
        drawCanvas.layer.addSublayer(orbitShape)
        
        projectile.updatePosition(getTouchingPoint(planet, projectile, degree: -145))
        
        
        milkWayCanvas.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        milkWayCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        milkWayCanvas.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        milkWayCanvas.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        drawCanvas.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        drawCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        drawCanvas.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        drawCanvas.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        showLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        showLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        showLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        showLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        hightLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        hightLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        hightLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        hightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    @objc func handleAnimation(loop: CADisplayLink){
        
        if !planet.checkCollision(projectile) {
            let force = planet.attract(projectile)
            projectile.applyForce(force)
            projectile.update()
            
            if firstLoop {
                orbitPath.move(to: projectile.center)
                prevPoint = projectile.center
                firstLoop = !firstLoop
                initialY = Double(projectile.center.y)
            } else {
                orbitPath.addLine(to: projectile.center)
                totalOrbitalPath(prevPoint, projectile.center)
                prevPoint = projectile.center
                orbitShape.path = orbitPath
            }
            
            currHighPosition = initialY - Double(projectile.center.y)
            
        } else {
            UIView.animate(withDuration: 1) {
                self.showLabel.alpha = 1
            }
        }
        
        if currHighPosition > 10000 {
            UIView.animate(withDuration: 1) {
                self.showLabel.alpha = 1
            }
        }
        
    }
    
    func getTouchingPoint(_ body: BodyView, _ body2: BodyView, degree: Float) -> float2{
        let radians = degree * .pi / 180
        let x = body.pos.x + Float(body.radius + body2.radius + 1) * cos(radians)
        let y = body.pos.y + Float(body.radius + body2.radius + 1) * sin(radians)
        return float2(x,y)
    }
    
    
    func totalOrbitalPath(_ fstPoint: CGPoint, _ currPoint: CGPoint){
        let deltaX = fstPoint.x - currPoint.x
        let deltaY = fstPoint.y - currPoint.y
        let lenght = sqrt(deltaX * deltaX + deltaY * deltaY)
        totalLenght += lenght
        let myStartPoint = 1 - ( 2600 / totalLenght )
        orbitShape.strokeStart = myStartPoint
    }
    
    
    
    
    
}
