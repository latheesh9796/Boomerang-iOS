//
//  PlaceMatchDetailViewController.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/29/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PlaceMatchDetailViewController: UIViewController {
    
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    
    @IBOutlet var mapOuterView: UIView!
    @IBOutlet var placeMatchImageView: UIImageView!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var placeMatchImageViewHeight: NSLayoutConstraint!
    @IBOutlet var bottomView: UIView!
    @IBOutlet var viewDealsButtonWidth: NSLayoutConstraint!
    @IBOutlet var viewDealsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getScreenWidthAndHeight()
        setImageHeight()
        setCustomStyles()
    }

    func getScreenWidthAndHeight() {
        let screenRect = UIScreen.main.bounds
        screenWidth = screenRect.size.width
        screenHeight = screenRect.size.height
    }
    
    func setImageHeight(){
        placeMatchImageViewHeight.constant = screenHeight*0.52
    }
    
    func setCustomStyles(){
        backButton.backgroundColor = UIColor.darkGray.withAlphaComponent(0.4)
        backButton.layer.cornerRadius = 10
        bottomView.layer.shadowRadius = 3.0
        bottomView.layer.shadowColor = UIColor.black.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        bottomView.layer.shadowOpacity = 0.5
        bottomView.layer.masksToBounds = false
        viewDealsButtonWidth.constant = screenWidth * 0.35
        viewDealsButton.layer.cornerRadius = 10
        mapOuterView.layer.cornerRadius = 10
        mapView.layer.cornerRadius = 10
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
}
