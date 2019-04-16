//
//  SchwarzschildBar.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 23/03/2019.
//

import Foundation
import UIKit


class SchwarzschildBar: UIView {
    
    private var totalWidth: CGFloat = 615

    private var widthConstraint: NSLayoutConstraint?
    
    let fieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Star's density:"
        return label
    }()
    
    let massBar: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        return v
    }()
    
    let trackView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.white.cgColor
        return v
    }()
    
    let additionalInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Schwarzschild radius for current mass: -\nStar's radius: 125"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpViewsAndConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        totalWidth = trackView.frame.width
    }
    
    func setUpViewsAndConstraints(){
        addMultSubView(fieldLabel, trackView, massBar, additionalInfoLabel)
        
        fieldLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        fieldLabel.leftAnchor.constraint(equalTo: trackView.leftAnchor, constant: 0).isActive = true
        fieldLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        fieldLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        trackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        trackView.topAnchor.constraint(equalTo: fieldLabel.bottomAnchor, constant: 5).isActive = true
        trackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        trackView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        massBar.leftAnchor.constraint(equalTo: trackView.leftAnchor, constant: 0).isActive = true
        massBar.centerYAnchor.constraint(equalTo: trackView.centerYAnchor, constant: 0).isActive = true
        massBar.heightAnchor.constraint(equalTo: trackView.heightAnchor).isActive = true
        widthConstraint = massBar.widthAnchor.constraint(equalToConstant: 0)
        widthConstraint?.isActive = true
        
        additionalInfoLabel.topAnchor.constraint(equalTo: massBar.bottomAnchor, constant: 5).isActive = true
        additionalInfoLabel.leftAnchor.constraint(equalTo: trackView.leftAnchor).isActive = true
        additionalInfoLabel.widthAnchor.constraint(equalTo: trackView.widthAnchor).isActive = true
        additionalInfoLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    }
    
    func createLabelForInfoLabel(_ Schwarzschild: Double, _ currRadius: CGFloat){
        additionalInfoLabel.text = "Schwarzschild radius for current mass: \(Schwarzschild.roundTo())\nStar's radius: \(currRadius)"
    }
    
    func updateMultiplier(_ mult: CGFloat){
        let m = mult > 1 ? 1 : mult
        let redFactor = m
        let greenFactor = 1 - m
        widthConstraint?.constant = m * totalWidth
        massBar.backgroundColor = UIColor(red: redFactor, green: greenFactor, blue: 0, alpha: 1)
    }
    
    
}
