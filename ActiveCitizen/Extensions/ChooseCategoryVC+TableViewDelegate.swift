//
//  ChooseCategoryVC+TableViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension ChooseCategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let chooseSubCategoryViewController = ChooseSubCategoryViewController.instantiate() as! ChooseSubCategoryViewController
        
        let categoryId = dataSource?.data![indexPath.row].categoryId
        let categoryIcon = dataSource?.data![indexPath.row].categoryIcon

        chooseSubCategoryViewController.categoryID = categoryId
        chooseSubCategoryViewController.completionHandler = { subcategory in
            self.completionHandler!(categoryIcon!, subcategory)
        }
        navigationController?.pushViewController(chooseSubCategoryViewController, animated: true)
    }
}
