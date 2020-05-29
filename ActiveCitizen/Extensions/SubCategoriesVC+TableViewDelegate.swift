//
//  ChooseSubCategoryVC+TableViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension SubCategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryName = dataSource?.data![indexPath.row].subCategoryName
        
        completionHandler!(categoryName!)
        defaultValues.set(indexPath.row, forKey: Keys.selectedSubCategory)
        
        navigationController?.popToRootViewController(animated: true)
    }
}
