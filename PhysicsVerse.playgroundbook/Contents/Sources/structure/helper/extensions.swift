//
//  extensions.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 20/03/2019.
//

import Foundation
import UIKit
import simd

extension CGPoint {
    static func fromVector(_ vector: simd_float2) -> CGPoint{
        return CGPoint(x: CGFloat(vector.x), y: CGFloat(vector.y))
    }
    
    func toVector() -> simd_float2{
        return simd_float2(Float(self.x), Float(self.y))
    }
    
    func adj() -> CGPoint{
        return CGPoint(x:self.x + UIScreen.main.bounds.midX / 2, y: self.y + UIScreen.main.bounds.midY)
    }
    
    func reverseAdj() -> CGPoint {
        return CGPoint(x:self.x - UIScreen.main.bounds.midX / 2, y: self.y - UIScreen.main.bounds.midY)
    }
    
    func sub(_ x: CGFloat = 0, _ y: CGFloat = 0) -> CGPoint{
      return CGPoint(x: self.x - x, y: self.y - y)
    }
    
    func add(_ x: CGFloat = 0, _ y: CGFloat = 0) -> CGPoint{
        return CGPoint(x: self.x + x, y: self.y + y)
    }
    
    func add(_ point: CGPoint) -> CGPoint{
        return CGPoint(x: self.x + point.x, y: self.y + point.y)
    }
}


extension UIImageView {
    func getTexture(_ body: BodiesName) {
        DispatchQueue.main.async {
            self.image = UIImage(named: body.rawValue)
        }
    }
}


extension UIView {
    func addMultSubView(_ views: UIView...){
        for view in views {
            addSubview(view)
        }
    }
}


extension simd_float2 {
    static var zero: simd_float2 {
        get {
            return simd_float2(0, 0)
        }
    }
    
    func addPoint(_ point: CGPoint) -> float2 {
        return float2(self.x + Float(point.x), self.y + Float(point.y))
    }
}


extension Double {
    func roundTo(_ decimalPlaces: Int = 1) -> Double {
        if decimalPlaces < 1 {return -1}
        var dividend: Double = 1
        for _ in 0..<decimalPlaces {
            dividend *= 10
        }
        let roundedNumber = (self * dividend).rounded() / dividend
        return roundedNumber
    }
}
