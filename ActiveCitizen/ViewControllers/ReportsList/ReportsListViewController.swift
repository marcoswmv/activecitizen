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
    
    var dataSource: ReportsListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        keyboardManagment = true
    }
    
    func setupDataSource() {
        dataSource = ReportsListDataSource(tableView: self.tableView)
//        dataSource?.onLoading = { (isLoading) in
//            self.displayLoading(loading: isLoading)
//        }
        dataSource?.reload()
    }
    
    
//    MARK: - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("A cell was selected!")
        
        let vc = ReportDetailsViewController.instantiate() as! ReportDetailsViewController
        
        vc.report = dataSource?.data![indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
