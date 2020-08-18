//
//  SearchViewController.swift
//  Boomerang
//
//  Created by Latheeshwarraj Mohanraj on 3/30/20.
//  Copyright © 2020 Latheeshwarraj Mohanraj. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var historyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomStyles()
        setupHistoryTableView()
    }
    
    func setupCustomStyles(){
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
        searchTextField.tintColor = UIColor.lightGray
        let image = UIImage(systemName: "magnifyingglass")
        searchTextField.setLeftIcon(image!)
    }

    func setupHistoryTableView(){
        historyTableView.allowsSelection = false
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
        dismiss(animated: false, completion: nil)
    }
}

extension SearchViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        return cell
    }
}
