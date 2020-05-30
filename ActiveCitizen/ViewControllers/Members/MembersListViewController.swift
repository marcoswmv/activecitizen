//
//  UsersListViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class MembersListViewController: BaseMembersViewController {
    
//    MARK: - OUTLETS
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
//    MARK: - PROPERTIES
    var refreshControl = UIRefreshControl()
    var dataSource: MembersDataSource?
    var timer: Timer?
    
    
//    MARK: - METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(with: "Участники")
        setupDataSource()
        self.hideKeyboardWhenTappedAround()
        keyboardManagment = true
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = .acSearchBarGray
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarShadow(activate: true)
    }
    
    func setupDataSource() {
        dataSource = MembersDataSource(tableView: self.tableView)
        dataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.reload()
    }
}
