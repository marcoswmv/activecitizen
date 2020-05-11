//
//  SubVotingViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 10.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SubVotingViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataSource: VotesDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataSource()
        self.hideKeyboardWhenTappedAround()
        keyboardManagment = true
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.backgroundColor = .acSearchBarGray
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setupDataSource() {
        dataSource = VotesDataSource(tableView: self.tableView)
        dataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.reload()
    }
}
