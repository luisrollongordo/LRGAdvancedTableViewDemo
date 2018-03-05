//
//  CustomSearchController.swift
//  CustomCell_Demo
//
//  Created by Luis Rollon Gordo on 1/11/16.
//  Copyright © 2016 EfectoApple. All rights reserved.
//

import UIKit

protocol CustomSearchControllerDelegate {
    func didStartSearching()
    
    func didTapOnSearchButton()
    
    func didTapOnCancelButton()
    
    func didChangeSearchText(_ searchText: String)
}


class CustomSearchController: UISearchController, UISearchBarDelegate {
    
    var customSearchBar: CustomSearchBar!
    
    var customDelegate: CustomSearchControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: Inicialización
    
    init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchBarTintColor: UIColor) {
        super.init(searchResultsController: searchResultsController)
        
        configureSearchBar(searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchBarTintColor)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureSearchBar(_ frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
        customSearchBar = CustomSearchBar(frame: frame, font: font , textColor: textColor)
        
        customSearchBar.barTintColor = bgColor
        customSearchBar.tintColor = textColor
        customSearchBar.showsBookmarkButton = true
        customSearchBar.showsCancelButton = true
        
        customSearchBar.delegate = self
    }
    
    // MARK: Funciones de UISearchBarDelegate
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        customDelegate.didStartSearching()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnSearchButton()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnCancelButton()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        customDelegate.didChangeSearchText(searchText)
    }
    
}
