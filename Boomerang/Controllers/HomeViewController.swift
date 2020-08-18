//
//  HomeViewController.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/27/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

class HomeViewController : UIViewController {
    
    @IBOutlet var datesButton: UIButton!
    @IBOutlet var datesButtonHeight: NSLayoutConstraint!
    @IBOutlet var showAllCategoriesButton: UIButton!
    @IBOutlet var datesButtonWidth: NSLayoutConstraint!
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var categoryCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet var placesCollectionView: UICollectionView!
    @IBOutlet var placesCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet var popularPlacesCollectionView: UICollectionView!
    @IBOutlet var popularPlacesCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet var searchTextField: UITextField!
    
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBarItem()
        getScreenWidthAndHeight()
        setupCategoryCollectionView()
        setupPlacesCollectionView()
        setupSearchTextField()
        setupPopularPlacesCollectionView()
        setupButtonStyles()
        popularPlacesCollectionView.reloadData()
        placesCollectionView.reloadData()
    }
    
    func hideNavigationBarItem(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupSearchTextField(){
        searchTextField.returnKeyType = UIReturnKeyType.done
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
    
    func setupPopularPlacesCollectionView(){
        popularPlacesCollectionView.delegate = self
        popularPlacesCollectionView.dataSource = self
        popularPlacesCollectionView.register(UINib(nibName: "PlacesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "PlacesCollectionViewCell")
        popularPlacesCollectionViewHeight.constant = (2*screenWidth)/3.0
    }
    
    func setupPlacesCollectionView(){
        placesCollectionView.dataSource = self
        placesCollectionView.delegate = self
        placesCollectionView.register(UINib(nibName: "PlacesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "PlacesCollectionViewCell")
        placesCollectionViewHeight.constant = (2*screenWidth)/3.0
    }
    
    func setupCategoryCollectionView() {
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionViewHeight.constant = (1.5*screenWidth)/3.0
    }
    
    func getScreenWidthAndHeight() {
        let screenRect = UIScreen.main.bounds
        screenWidth = screenRect.size.width
        screenHeight = screenRect.size.height
    }
    
   func setupButtonStyles() {
        datesButton.layer.cornerRadius = 20
        datesButton.layer.borderColor = UIColor.gray.cgColor
        datesButton.layer.borderWidth = 0.5
        datesButton.setTitle("Dates", for: .normal)
        datesButton.sizeToFit()
        showAllCategoriesButton.layer.cornerRadius = 10
        
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            let image = Helper.getPotraitImage()
            cell.categoryImage.image = image
            cell.blurImage.image = image
            return cell
        } else if collectionView == popularPlacesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCollectionViewCell", for: indexPath) as! PlacesCollectionViewCell
            let image = Helper.getLandscapeImage()
            cell.placeImage.image = image
            cell.blurImage.image = image
            return cell
        } else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCollectionViewCell", for: indexPath) as! PlacesCollectionViewCell
            let image = Helper.getLandscapeImage()
            cell.placeImage.image = image
            cell.blurImage.image = image
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView{
            let width = screenWidth/3.0
            return CGSize(width: width, height: width*1.5)
        } else {
            let width = screenWidth * 0.75
            let height = (2*screenWidth/3.0)
            return CGSize(width: width,height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "PlaceDetailViewController") as! PlaceDetailViewController
            self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: false)
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}

