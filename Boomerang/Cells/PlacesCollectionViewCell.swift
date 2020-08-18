//
//  PlacesCollectionViewCell.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/28/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {

    @IBOutlet var starImageWidth: NSLayoutConstraint!
    
    @IBOutlet var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet var placeImage: UIImageView!
    @IBOutlet var blurImage: UIImageView!
    @IBOutlet var blurImageWidth: NSLayoutConstraint!
    @IBOutlet var viewWidth: NSLayoutConstraint!
    @IBOutlet var matchesView: UIView!
    @IBOutlet var placeLocation: UILabel!
    @IBOutlet var placeName: UILabel!
    @IBOutlet var matchesCount: UILabel!
    @IBOutlet var placeStarRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let screenWidth = UIScreen.main.bounds.size.width
        self.blurImageWidth.constant = screenWidth
        let blurEffect = UIBlurEffect(style: .light)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = CGRect(x: 0 , y: 0, width: screenWidth, height: self.blurImage.frame.height + 6)
        self.blurImage.addSubview(blurredEffectView)
        self.contentView.layer.cornerRadius = 16.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.viewWidth.constant = screenWidth * 0.75
        self.matchesView.layer.cornerRadius = 8.0
    }
    override init(frame: CGRect) {
         super.init(frame: frame)
     }
     
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     }
     

}
