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
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
        
        onLoading?(true)
        manager.getReportsList { (result, error) in
            
            self.onLoading?(false)
            if error != nil {
                self.onError?(error!)
                return
            }
            
            self.data = result
            self.tableView.reloadData()
        }
    }
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ReportsListTableViewCell.identifier)! as! ReportsListTableViewCell
        cell.data = data![indexPath.row]
        return cell
    }
    
}
