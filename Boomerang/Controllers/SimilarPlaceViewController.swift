//
//  SimilarPlaceViewController.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/29/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

class SimilarPlaceViewController: UIViewController {
    
    @IBOutlet var placeImage: UIImageView!
    @IBOutlet var similarPlaceCollectionView: UICollectionView!
    @IBOutlet var placeImageHeight: NSLayoutConstraint!
    @IBOutlet var backButton: UIButton!
    
    var screenWidth:CGFloat = 0.0
    var screenHeight:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
        getScreenWidthAndHeight()
        setImageHeight()
        setupCollectionView()
        setButtonStyles()
    }
    
    func setButtonStyles(){
        backButton.layer.cornerRadius = 10
        backButton.backgroundColor = UIColor.darkGray.withAlphaComponent(0.4)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setImageHeight(){
        placeImageHeight.constant = screenHeight*0.35
    }
    
    func setupCollectionView(){
        similarPlaceCollectionView.register(UINib(nibName: "SimilarPlaceCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "SimilarPlaceCollectionViewCell")
        similarPlaceCollectionView.delegate = self
        similarPlaceCollectionView.dataSource = self
    }
    
    func getScreenWidthAndHeight() {
        let screenRect = UIScreen.main.bounds
        screenWidth = screenRect.size.width
        screenHeight = screenRect.size.height
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

extension SimilarPlaceViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarPlaceCollectionViewCell", for: indexPath) as! SimilarPlaceCollectionViewCell
        cell.similarPlaceImage.image = Helper.getSimilarImage()
        cell.blurImage.image = Helper.getSimilarImage()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "PlaceMatchDetailViewController") as! PlaceMatchDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
