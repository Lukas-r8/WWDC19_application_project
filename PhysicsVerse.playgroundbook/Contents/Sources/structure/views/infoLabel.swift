//
//  infoLabel.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 22/03/2019.
//

import Foundation
import UIKit


class infoLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        createMassInfoString(0,0,"----", 0, "0", 0)
            layer.cornerRadius = 15
            layer.borderColor = UIColor.white.cgColor
            layer.borderWidth = 1
            textColor = .white
            lineBreakMode = NSLineBreakMode.byWordWrapping
            numberOfLines = 0
            translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.insetBy(dx: 10, dy: 5))
    }
    
    func createAdjustedStr(_ str: String, _ alpha: CGFloat = 0){
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = alpha
        }) { (success) in
            self.text = str + "\n"
        }
    }
    
    func createMassInfoString(_ personMass: Double,_ weight:Double,_ planetName: String,_ acc: Double,_ planetMass: String,_ eq: Double ) {
        text = "Person's mass: \n\(personMass)Kg\nWeight: \n\(weight)Newtons\nPlanet: \n\(planetName)\nPlanet's mass: \n\(planetMass)kg\nAcceleration: \n\(acc)/m/s\nEarth's equivalent: \n\(eq)Kg\n"
    }
    
    
}
