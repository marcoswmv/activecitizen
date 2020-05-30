//
//  CategoryViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class CategoriesViewController: BaseMakeReportViewController {
    
//    MARK:  - OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
//    MARK: - PROPERTIES
    
    var completionHandler: ((_ icon: UIImage, _ subcategory: String, _ categoryId: Int, _ subCategoryId: Int) -> Void)?
    var dataSource: CategoriesDataSource?
    var defaultValues: UserDefaults = UserDefaults.standard
    var timer: Timer?
    
    
//    MARK: - METHODS
    
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
