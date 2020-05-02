//
//  UsersListViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class MembersListViewController: BaseMembersListViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl = UIRefreshControl()
    var dataSource: MembersDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataSource()
        self.hideKeyboardWhenTappedAround()
        tableView.separatorStyle = .none
        keyboardManagment = true
    }
    
    func setupDataSource() {
        dataSource = MembersDataSource(tableView: self.tableView)
        dataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.reload()
    }

}
