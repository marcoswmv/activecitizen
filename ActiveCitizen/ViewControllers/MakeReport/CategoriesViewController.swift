//
//  CategoryViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseMakeReportViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var completionHandler: ((UIImage, String) -> Void)?
    var dataSource: CategoriesDataSource?
    
    var defaultValues: UserDefaults = UserDefaults.standard
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        keyboardManagment = true
        setupCustomBackButton(with: "Категории", icon: "back")
        setupNavigationBarShadow(activate: true)
    }
    
    func setupDataSource() {
        dataSource = CategoriesDataSource(tableView: self.tableView)
        dataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.reload()
    }
}
