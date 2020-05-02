//
//  ReportsListViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListViewController: BaseReportsListViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    var dataSource: ReportsListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        setupUIElements()
    }
    
    func setupDataSource() {
        dataSource = ReportsListDataSource(tableView: self.tableView)
        dataSource?.onLoading = { (isLoading) in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.reload()
    }
    
    func setupUIElements() {
        keyboardManagment = true
        
        refreshControl.addTarget(self, action: #selector(self.handleRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func handleRefresh() {
        dataSource?.reload()
        refreshControl.endRefreshing()
    }
//    MARK: - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ReportDetailsViewController.instantiate() as! ReportDetailsViewController
        
        vc.report = dataSource?.data![indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
