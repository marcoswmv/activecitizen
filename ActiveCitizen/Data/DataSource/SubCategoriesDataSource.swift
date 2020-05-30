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
    
    private var filteredData: [SubCategory]?
    private var searching: Bool = false
    private var defaultValues: UserDefaults = UserDefaults.standard
    var categoryID: Int?
    
    override func setup() {
        DispatchQueue.once {
            defaultValues.removeObject(forKey: Keys.selectedSubCategory)
        }
        super.setup()
    }
    
    override func reload() {

        var hardCodedresult = [SubCategory]()
        _ = DummyData.subCategories.map({ hardCodedresult.append(SubCategory(dictionary: $0)) })

        data = hardCodedresult
        tableView.reloadData()
        
//        onLoading?(true)
//        manager.getSubCategories(categoryId: categoryID!, completion: { (result, error) in
//            self.onLoading?(false)
//            if error != nil {
//                self.onError?(error!)
//                return
//            }
//
//            self.data = result
//            self.tableView.reloadData()
//        })
    }
    
    func startQuery(with text: String) {
        searching = !text.isEmpty ? true : false
        filteredData = data?.filter({ $0.subCategoryName!.prefix(text.count).lowercased() == text.lowercased() })
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
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: SubCategoriesTableViewCell.identifier)! as! SubCategoriesTableViewCell
        
        if searching {
            cell.data = filteredData![indexPath.row]
        } else {
            cell.data = data![indexPath.row]
        }
        
        if let selectedRow = defaultValues.value(forKey: Keys.selectedSubCategory) as? Int {
            let selectedIndexPath = IndexPath(row: selectedRow, section: indexPath.section)
            
            if indexPath == selectedIndexPath {
                cell.textLabel?.font = UIFont(name: UIFont.mediumFontFmily, size: 15.0)
                cell.accessoryView = UIImageView(image: UIImage(named: "chek-on"))
            } else {
                cell.textLabel?.font = UIFont(name: UIFont.regularFontFmily, size: 15.0)
                cell.accessoryView = UIImageView(image: UIImage())
            }
        }
        
        return cell
    }
}
