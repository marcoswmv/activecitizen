//
//  CategoriesDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class CategoriesDataSource: BaseDataSource {
    
    private let manager: CategoriesManager = CategoriesManager()
    private(set) var data: [Category]?
    
    var defaultValues: UserDefaults = UserDefaults.standard
    
    override func setup() {
        super.setup()
    }
    
    override func reload() {
        
        let users: [[String: Any]] = [[ "id": 1101, "name": "Благоустройство дворовой территории"],
                                      [ "id": 1102, "name": "Автомобильные дороги"],
                                      [ "id": 1103, "name": "Водоснабжение в многоквартирном доме"],
                                      [ "id": 1104, "name": "Газ и топливо"],
                                      [ "id": 1105, "name": "Многоквартирные дома"],
                                      [ "id": 1106, "name": "Общественный транспорт"],
                                      [ "id": 1107, "name": "Плата за ЖКУ и работа ЕИРЦ"],
                                      [ "id": 1108, "name": "Народный инспектор"]]
        var hardCodedresult: [Category] = [Category]()

        for user in users {
            hardCodedresult.append(Category(dictionary: user))
        }

        data = hardCodedresult
        tableView.reloadData()
        
//        onLoading?(true)
//        manager.getCategories { (result, error) in
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
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier)! as! CategoriesTableViewCell
        
        cell.data = data![indexPath.row]
        
        if let selectedRow = defaultValues.value(forKey: Keys.selectedCategory) as? Int {
            let selectedIndexPath = IndexPath(row: selectedRow, section: indexPath.section)
            
            if indexPath == selectedIndexPath {
                cell.nameLabel.font = UIFont(name: UIFont.mediumFontFmily, size: 15.0)
            } else {
                cell.nameLabel.font = UIFont(name: UIFont.regularFontFmily, size: 15.0)
            }
        }
        
        return cell
    }
}
