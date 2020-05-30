//
//  NotificationsDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 31.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class NotificationsDataSource: BaseDataSource {
    
    
//    MARK: Check if there is a request for notifications or it's data come from reports
    
    private let manager = ReportsManager()
    private(set) var data: [Report]?
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
 
        var result = [Report]()
        _ = DummyData.reports.map({ result.append(Report(dictionary: $0)) })
        
        data = result
        tableView.reloadData()
        
        
//        onLoading?(true)
//
//        manager.getReportsList { (result, error) in
//
//            self.onLoading?(false)
//            if error != nil {
//                self.onError?(error!)
//                return
//            }
//
//            self.data = result
//            self.tableView.reloadData()
//        }
    }
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ReportsListTableViewCell.identifier)! as! ReportsListTableViewCell
        
        cell.data = data![indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}
