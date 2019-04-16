//
//  Person.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 21/03/2019.
//

import Foundation
import UIKit


class Person: BodyView {
    
    
    let massLabel: UILabel =  {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.text = "mass"
        return label
    }()
    
    
    
    
    required init(_ attr: Attributes) {
        super.init(attr)
        setUpViewsAnsConstraints()
        name = "person"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func setUpPlanet() {
        super.setUpPlanet()
        
        backgroundColor = .clear
        layer.cornerRadius = 0
        bounds.size = CGSize(width: diameter / 2.3, height: diameter)
        
        textureView.layer.cornerRadius = 0
        textureView.frame.size = frame.size
        textureView.tintColor = UIColor.white
        
    }
    
    
    func setUpViewsAnsConstraints(){
        addMultSubView(massLabel)
        
        massLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        massLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -48).isActive = true
        massLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        massLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
}
