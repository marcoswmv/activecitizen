//
//  FiltersViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class FilterCategoriesViewController: BaseMembersViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var topViewController: String?
    var completionHandler: ((String?) -> Void)?
    var defaultValues = UserDefaults.standard
    var data = ["Не выбрано", "Статус", "Категория", "Период"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.once {
            defaultValues.removeObject(forKey: Keys.selectedFilterCategory)
        }
        
        setupNavigationBarShadow(activate: true)
        setupCustomBackButton(with: "Фильтр", icon: "back")
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
