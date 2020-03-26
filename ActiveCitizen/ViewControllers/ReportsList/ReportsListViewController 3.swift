//
//  ReportsListViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListViewController: BaseReportsListViewController {

    var dataSource: ReportsListDataSource?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ReportsListDataSource(tableView: self.tableView)
        dataSource?.onLoading = { (isLoading) in
            self.displayLoading(loading: isLoading)
        }
        dataSource?.reload()
        
//        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ReportDetailsViewController.instantiate() as! ReportDetailsViewController
        vc.report = dataSource?.data![indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
