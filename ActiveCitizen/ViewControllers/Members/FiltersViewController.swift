//
//  FiltersViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class FiltersViewController: BaseMembersViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [String]()
    var navigationBarTitle: String? = nil
    
    var completionHandler: ((String?) -> Void)?
    
    var defaultValues: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.once {
            defaultValues.removeObject(forKey: Keys.selectedFilter)
        }
        
        setupNavigationBarShadow(activate: true)
        if let title = navigationBarTitle {
            setupCustomBackButton(with: title, icon: "back")
        }
    }
    
}



//    MARK: - Delegate

extension FiltersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath)
        let memberDetailViewController = navigationController?.viewControllers[1] as! MemberDetailViewController
        
        cell.accessoryView = UIImageView(image: UIImage(named: "chek-on"))
        
        defaultValues.set(indexPath.row, forKey: Keys.selectedFilter)
        completionHandler?(data[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.popToViewController(memberDetailViewController, animated: true)
    }
}



//    MARK: - Data source

extension FiltersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell")!
        let firstCellIndexPath = IndexPath(row: 0, section: 0)
        
        cell.textLabel?.text = data[indexPath.row]
        
        if let selectedRow = defaultValues.value(forKey: Keys.selectedFilter) as? Int {
            let selectedIndexPath = IndexPath(row: selectedRow, section: indexPath.section)
            
            if indexPath == selectedIndexPath {
                cell.accessoryView = UIImageView(image: UIImage(named: "chek-on")!)
            } else {
                cell.accessoryView = UIImageView(image: UIImage())
            }
        } else {
            if indexPath == firstCellIndexPath {
                cell.accessoryView = UIImageView(image: UIImage(named: "chek-on")!)
            }
        }
        
        return cell
    }
}
