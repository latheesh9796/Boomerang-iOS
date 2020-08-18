//
//  UITextField.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/29/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

extension UITextField: UITextViewDelegate {
    func setIconToMiddle(_ image: UIImage) {
    let padding =  (UIScreen.main.bounds.size.width - 48 ) * 0.42
       let iconView = UIImageView(frame:
                      CGRect(x: padding-30, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: padding, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
       let tap = UITapGestureRecognizer(target: self, action: #selector(self.activateTextField(_:)))
       iconContainerView.addGestureRecognizer(tap)
    }
    
    func setLeftIcon(_ icon: UIImage) {
       let padding = 8
       let size = 20
       let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding+8, height: size) )
       let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
       iconView.image = icon
       outerView.addSubview(iconView)
       leftView = outerView
       leftViewMode = .always
     }
    
    @objc func activateTextField(_ sender: UITapGestureRecognizer? = nil) {
        becomeFirstResponder()
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
}
