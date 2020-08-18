//
//  SimilarPlaceCollectionViewCell.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/29/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

class SimilarPlaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet var viewWidth: NSLayoutConstraint!
    @IBOutlet var similarPlaceImage: UIImageView!
    @IBOutlet var blurImageHeight: NSLayoutConstraint!
    @IBOutlet var blurImage: UIImageView!
    @IBOutlet var blurImageWidth: NSLayoutConstraint!
    @IBOutlet var similarPlaceImageWidth: NSLayoutConstraint!
    @IBOutlet var matchesView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let screenWidth = UIScreen.main.bounds.size.width
        self.similarPlaceImageWidth.constant = screenWidth * 0.9
        self.blurImageWidth.constant = screenWidth
        let blurEffect = UIBlurEffect(style: .light)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = CGRect(x: 0 , y: 0, width: screenWidth * 0.9, height: self.blurImage.frame.height + 6)
        self.blurImage.addSubview(blurredEffectView)
        self.contentView.layer.cornerRadius = 16.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.viewWidth.constant = screenWidth * 0.9
        self.matchesView.layer.cornerRadius = 8.0
        matchesView.layer.shadowRadius = 3.0
        matchesView.layer.shadowColor = UIColor.black.cgColor
        matchesView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        matchesView.layer.shadowOpacity = 0.5
        matchesView.layer.masksToBounds = false
    }
    
    override init(frame: CGRect) {
         super.init(frame: frame)
     }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     }
}
