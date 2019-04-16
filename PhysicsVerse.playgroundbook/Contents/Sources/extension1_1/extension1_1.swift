//
//  extension1_1.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 24/03/2019.
//

import Foundation
import UIKit
import simd

// helper Functions
extension LiveViewController_1_1 {
    
    
    @objc func resetOrbit(){
        animationLoop.isPaused = true
        sun.velocity = .zero
        UIView.animate(withDuration: 1) {
            self.earth.updatePosition(self.velocity == Velocity.veryHigh ? float2(-400, -300) : float2(0, -300))
            self.sun.updatePosition(float2(0,-150))
        }
        
        earth.velocity = velocity
        earth.drag = velocity == Velocity.low
        
        totalLenght = 0
        firstLoop = true
        
        elipsePath = CGMutablePath()
        orbitShape.path = elipsePath
    }
    
    
    
    @objc func startLoop(){
        animationLoop.isPaused = !animationLoop.isPaused
    }
    
    
    func setUpViews(){
        view.addMultSubView(milkWayCanvas, drawCanvas, infoLabel,earth, sun)
        drawCanvas.layer.addSublayer(orbitShape)
        
        
        milkWayCanvas.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        milkWayCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        milkWayCanvas.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        milkWayCanvas.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        drawCanvas.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        drawCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        drawCanvas.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        drawCanvas.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        infoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        infoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    @objc func loopHandler(loop: CADisplayLink){
        
        for planet in getAllPlanets {
            if planet.name != BodiesName.sun.rawValue {
                
                let force = sun.attract(planet)
                planet.applyForce(force)
                planet.update()
                
                if sun.checkIfMerged(planet) {
                    loop.isPaused = true
                    infoLabel.text = "oh it seems that this planet died :("
                }
                
                if firstLoop {
                    elipsePath.move(to: planet.center)
                    prevPoint = planet.center
                    firstLoop = !firstLoop
                    
                    planet.drag = velocity == Velocity.low
                    
                } else {
                    elipsePath.addLine(to: planet.center)
                    orbitShape.path = elipsePath
                    totalOrbitalPath(prevPoint, planet.center)
                    prevPoint = planet.center
                    
                }
            }
            
        }
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
