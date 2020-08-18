//
//  UILabel.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/29/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

extension UILabel {
    func increaseFontSize (_ size : Int) {
        self.font =  UIFont(name: self.font.fontName, size: self.font.pointSize + CGFloat(size))!
    }
}
