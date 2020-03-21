//
//  ChooseSubCategoryViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SubCategoriesViewController: BaseSubCategoryViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataSource: SubCategoriesDataSource?
    var completionHandler: ((String) -> Void)?
    var categoryID: Int?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = SubCategoriesDataSource(tableView: self.tableView)
        dataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.categoryID = categoryID
        dataSource?.reload()
    }

}
