//
//  BodyAttributes.swift
//  Book_Sources
//
//  Created by Lucas Alves Da Silva on 20/03/2019.
//

import Foundation
import UIKit
import simd

struct Attributes {
    var name: BodiesName
    var mass: Float
    var texture: UIImage?
    var diameter: CGFloat
    var acceleration: simd_float2
    var position: simd_float2
    var velocity: simd_float2
    
}
