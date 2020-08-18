//
//  Helper.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 4/1/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import Foundation
import UIKit
class Helper {
    static let landscapeImages = [UIImage(named: "landscape"),UIImage(named: "landscape2"),UIImage(named: "landscape3"),UIImage(named: "landscape4"),UIImage(named: "landscape5"),UIImage(named: "landscape6")]
    
    static let potraitImages = [UIImage(named: "potrait1"),UIImage(named: "potrait2"),UIImage(named: "potrait3"),UIImage(named: "potrait4"),UIImage(named: "potrait5")]
    
    static let similarImages = [UIImage(named: "similar1"),UIImage(named: "similar2")]
    static func getLandscapeImage() -> UIImage{
        return landscapeImages[Int.random(in: 0..<landscapeImages.count)]!
    }
    
    static func getPotraitImage() -> UIImage{
        return potraitImages[Int.random(in: 0..<potraitImages.count)]!
    }
    
    static func getSimilarImage() -> UIImage{
        return similarImages[Int.random(in: 0..<similarImages.count)]!
    }
}
