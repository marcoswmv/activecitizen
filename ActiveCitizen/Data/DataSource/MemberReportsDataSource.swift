//
//  UserReportsDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 17.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class MemberReportsDataSource: BaseDataSource {
    
    private let manager = ReportsManager()
    private(set) var data: [Report]?
    
    var memberID: Int?
    var filter: String?
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
//        TO-DO: Apply filters to the server request

        var result = [Report]()
        
        _ = DummyData.reports.map({
            let report = Report(dictionary: $0)
            if report.userID == memberID {
                result.append(report)
            }
        })

        data = result
        tableView.reloadData()
        
//        onLoading?(true)
//        manager.getReportsList { (result, error) in
//
//            self.onLoading?(false)
//            if error != nil {
//                self.onError?(error!)
//                return
//            }
//
//            var newData = [Report]()
//            if let result = result {
//                for report in result {
//                    if report.userID == self.memberID {
//                        newData.append(report)
//                    }
//                }
//            }
//
//            self.data = newData
//            self.tableView.reloadData()
//        }
    }
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MemberReportsTableViewCell.identifier) as! MemberReportsTableViewCell
        
        cell.data = data![indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
}
