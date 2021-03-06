//
//  ReportsListDataSource.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListDataSource: BaseDataSource {

    private let manager = ReportsManager()
    private(set) var data: [Report]?
    
    private var filteredData: [Report]?
    private var searching: Bool = false
    
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
    
    func startQuery(with text: String) {
        searching = !text.isEmpty ? true : false
        filteredData = data?.filter({ $0.id?.description.prefix(text.count).description == text })
        tableView.reloadData()
    }
    
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            if filteredData!.isEmpty {
                addTableViewBackgroundView(with: "Нет обращений")
            }
            return filteredData?.count ?? 0
        } else {
            if data!.isEmpty {
                addTableViewBackgroundView(with: "Нет обращений")
            }
            return data?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ReportsListTableViewCell.identifier)! as! ReportsListTableViewCell
        
        if searching {
            cell.data = filteredData![indexPath.row]
        } else {
            cell.data = data![indexPath.row]
        }
        cell.selectionStyle = .none
        
        return cell
    }
}
