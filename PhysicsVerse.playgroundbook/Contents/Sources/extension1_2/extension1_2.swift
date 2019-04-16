//
//  extension1_2.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 24/03/2019.
//

import Foundation
import UIKit
import simd

// helper functions
extension LiveViewController_1_2 {
    
    @objc func resetPage(){
        animationLoop.isPaused = true
        
        UIView.animate(withDuration: 1) {
            self.person.updatePosition(float2(0, -Float(self.view.frame.height / 2) + 110))
        }
        
    }
    
    
    
    @objc func handleLoop(loop: CADisplayLink){
        if planet.checkCollision(person) {
            person.bounce()
            person.update()
        } else {
            let force = planet.attract(person)
            person.applyForce(force)
            person.update()
        }
    }
    
    public func setUpViews(){
        view.addMultSubView(milkWayCanvas, info , planet, person)
        
        milkWayCanvas.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        milkWayCanvas.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        milkWayCanvas.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        milkWayCanvas.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        info.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        info.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        info.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        info.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
    }
    
    
    
}
