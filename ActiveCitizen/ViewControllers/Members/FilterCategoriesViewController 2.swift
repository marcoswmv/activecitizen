//
//  FiltersViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class FilterCategoriesViewController: BaseFilterCategoriesViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var completionHandler: ((String?) -> Void)?

    var defaultValues = UserDefaults.standard
    
    var categoriesDataSource: CategoriesDataSource?
    var data = ["Не выбрано", "Статус", "Категория", "Период"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}


// MARK: - Data Source

extension FilterCategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCategoriesTableViewCell")!
        let firstCellIndexPath = IndexPath(row: 0, section: 0)
        
        
        cell.textLabel?.text = data[indexPath.row]
        
        
        if let selectedRow = defaultValues.value(forKey: Keys.selectedFilterCategory) as? Int {
            let selectedIndexPath = IndexPath(row: selectedRow, section: indexPath.section)
            
            if indexPath == selectedIndexPath {
                cell.accessoryView = UIImageView(image: UIImage(named: "chek-on")!)
            } else {
                if indexPath != firstCellIndexPath {
                    cell.accessoryView = UIImageView(image: UIImage(named: "disclosure")!)
                } else {
                    cell.accessoryView = UIImageView(image: UIImage())
                }
            }
        } else {
            if indexPath == firstCellIndexPath {
                cell.accessoryView = UIImageView(image: UIImage(named: "chek-on")!)
            } else {
                cell.accessoryView = UIImageView(image: UIImage(named: "disclosure")!)
            }
        }
        
        return cell
    }
}