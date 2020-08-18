//
//  CategoriesCollectionViewCell.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/27/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var categoryName: UILabel!
    @IBOutlet var blurImage: UIImageView!
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var categoryCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        var blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = blurImage.bounds
        blurImage.addSubview(blurredEffectView)
        blurEffect = UIBlurEffect(style: .extraLight)
        blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = blurImage.bounds
        blurredEffectView.alpha = 0.5
        blurImage.addSubview(blurredEffectView)
        self.contentView.layer.cornerRadius = 16.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
