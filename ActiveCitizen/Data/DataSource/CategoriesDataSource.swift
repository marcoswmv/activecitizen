//
//  CategoriesDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class CategoriesDataSource: BaseDataSource {
    
    private let manager = CategoriesManager()
    private(set) var data: [Category]?
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
        
        onLoading?(true)
        manager.getCategories { (result, error) in
            
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
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier)! as! CategoriesTableViewCell
        
        cell.data = data![indexPath.row]
        return cell
    }
}
