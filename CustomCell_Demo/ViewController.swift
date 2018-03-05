//
//  ViewController.swift
//  CustomCell_Demo
//
//  Created by Luis Rollon Gordo on 1/11/16.
//  Copyright © 2016 EfectoApple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, CustomSearchControllerDelegate {
    
    @IBOutlet weak var tblSearchResults: UITableView!
    
    var dataArray = ["PUSHUPS", "RUNNING 100 M", "PULLUPS", "SITUPS", "RUNNING 400 M", "CLIMBERS"]
    
    var filteredArray = [String]()
    
    var shouldShowSearchResults = false
    
    var customSearchController: CustomSearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblSearchResults.delegate = self
        tblSearchResults.dataSource = self
        
        configureCustomSearchController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: Funciones de UITableViewDelegate y UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return filteredArray.count
        }
        else {
            return dataArray.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tblSearchResults.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! ExerciseTableViewCell
        
        if shouldShowSearchResults {
            cell.labelCell.text = filteredArray[indexPath.row]
            cell.imageCell.image = UIImage(named: filteredArray[indexPath.row])
        }
        else {
            cell.labelCell.text = dataArray[indexPath.row]
            cell.imageCell.image = UIImage(named: dataArray[indexPath.row])
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 204.0
    }
    
    func configureCustomSearchController() {
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRect(x: 0.0, y: 0.0, width: tblSearchResults.frame.size.width, height: 50.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.white, searchBarTintColor: UIColor.black)
        
        customSearchController.customSearchBar.placeholder = "Buscar en la lista de ejercicios..."
        tblSearchResults.tableHeaderView = customSearchController.customSearchBar
        
        customSearchController.customDelegate = self
    }
    
    // MARK: Funciones de CustomSearchControllerDelegate
    
    func didStartSearching() {
        tblSearchResults.reloadData()
    }
    
    
    func didTapOnSearchButton() {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tblSearchResults.reloadData()
        }
    }
    
    func didTapOnCancelButton() {
        shouldShowSearchResults = false
        tblSearchResults.reloadData()
    }
    
    func didChangeSearchText(_ searchText: String) {
        
        filteredArray = dataArray.filter({ (exercise) -> Bool in
            let exerciseText: NSString = exercise as NSString
            shouldShowSearchResults = true
            return (exerciseText.range(of: searchText, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        
        tblSearchResults.reloadData()
    }
}

