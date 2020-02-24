//
//  SubCategoriesDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SubCategoriesDataSource: BaseDataSource {

    private let manager = SubCategoriesManager()
    private(set) var data: [SubCategory]?
    
    var categoryID: Int?
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
        
        onLoading?(true)
        manager.getSubCategories(categoryId: categoryID!, completion: { (result, error) in
            self.onLoading?(false)
            if error != nil {
                self.onError?(error!)
                return
            }
            
            self.data = result
            self.tableView.reloadData()
        })
    }
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: SubCategoriesTableViewCell.identifier)! as! SubCategoriesTableViewCell
        cell.data = data![indexPath.row]
        return cell
    }
}
