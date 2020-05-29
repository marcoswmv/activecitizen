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
    
    private var filteredData: [Category]?
    private var searching: Bool = false
    private var defaultValues: UserDefaults = UserDefaults.standard
    
    override func setup() {
        DispatchQueue.once {
            defaultValues.removeObject(forKey: Keys.selectedCategory)
        }
        super.setup()
    }
    
    override func reload() {
        
        let categories: [[String: Any]] = [[ "id": 1101, "name": "Благоустройство дворовой территории"],
                                           [ "id": 1102, "name": "Автомобильные дороги"],
                                           [ "id": 1103, "name": "Водоснабжение в многоквартирном доме"],
                                           [ "id": 1104, "name": "Газ и топливо"],
                                           [ "id": 1105, "name": "Многоквартирные дома"],
                                           [ "id": 1106, "name": "Общественный транспорт"],
                                           [ "id": 1107, "name": "Плата за ЖКУ и работа ЕИРЦ"],
                                           [ "id": 1108, "name": "Народный инспектор"]]
        
        var hardCodedresult: [Category] = [Category]()
        for category in categories {
            hardCodedresult.append(Category(dictionary: category))
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
    
    func startQuery(with text: String) {
        searching = !text.isEmpty ? true : false
        filteredData = data?.filter({ $0.categoryName!.prefix(text.count).lowercased() == text.lowercased() })
        tableView.reloadData()
    }
    
    // MARK: - DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredData?.count ?? 0
        } else {
            return data?.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier)! as! CategoriesTableViewCell
        
        if searching {
            cell.data = filteredData![indexPath.row]
        } else {
            cell.data = data![indexPath.row]
        }
        
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
