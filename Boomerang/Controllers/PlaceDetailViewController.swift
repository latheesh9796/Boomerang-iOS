//
//  PlaceDetailViewController.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/28/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

class PlaceDetailViewController : UIViewController {
    
    @IBOutlet var datesButton: UIButton!
    @IBOutlet var filterButton: UIButton!
    @IBOutlet var placesCollectionView: UICollectionView!
    @IBOutlet var searchTextField: UITextField!
    
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        setupSearchTextField()
        setupButtonStyles()
        setupColectionView()
        getScreenWidthAndHeight()
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupSearchTextField(){
        searchTextField.returnKeyType = .search
        searchTextField.delegate = self
        searchTextField.layer.cornerRadius = 10.0
        searchTextField.layer.borderWidth = 2.0
        searchTextField.layer.borderColor = UIColor.white.withAlphaComponent(1).cgColor
        searchTextField.layer.shadowRadius = 8.0
        searchTextField.layer.shadowColor = UIColor.lightGray.cgColor
        searchTextField.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        searchTextField.layer.shadowOpacity = 0.3
        searchTextField.layer.masksToBounds = false
        searchTextField.textColor = UIColor.lightGray
        searchTextField.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 36, height: 36))
        searchTextField.tintColor = UIColor.lightGray
        let image = UIImage(systemName: "magnifyingglass")
        imageView.image = image
        searchTextField.setIconToMiddle(image!)
    }
    
    func getScreenWidthAndHeight() {
        let screenRect = UIScreen.main.bounds
        screenWidth = screenRect.size.width
        screenHeight = screenRect.size.height
    }
    
    func setupColectionView(){
        placesCollectionView.delegate = self
        placesCollectionView.dataSource = self
        placesCollectionView.register(UINib(nibName: "PlacesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "PlacesCollectionViewCell")
    }
    
    func setupButtonStyles(){
        datesButton.layer.cornerRadius = 20
        datesButton.layer.borderColor = UIColor.gray.cgColor
        datesButton.layer.borderWidth = 0.5
        datesButton.setTitle("Dates", for: .normal)
        datesButton.sizeToFit()
        filterButton.layer.cornerRadius = 20
        filterButton.layer.borderColor = UIColor.gray.cgColor
        filterButton.layer.borderWidth = 0.5
        filterButton.setTitle("Filter", for: .normal)
        filterButton.sizeToFit()
    }
}

extension PlaceDetailViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCollectionViewCell", for: indexPath) as! PlacesCollectionViewCell
        cell.viewWidth.constant = screenWidth * 0.9
        cell.bottomViewHeight.constant = 54
        let image = Helper.getLandscapeImage()
        cell.placeImage.image = image
        cell.blurImage.image = image
        cell.starImageWidth.constant = 18
        cell.placeStarRating.increaseFontSize(4)
        cell.placeName.font = cell.placeName.font.withSize(18)
        cell.placeLocation.font = cell.placeLocation.font.withSize(11)
        cell.placeStarRating.font = cell.placeStarRating.font.withSize(11)
        cell.matchesCount.font = cell.matchesCount.font.withSize(11)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SimilarPlaceViewController") as! SimilarPlaceViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PlaceDetailViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: false)
        return false
    }
}


