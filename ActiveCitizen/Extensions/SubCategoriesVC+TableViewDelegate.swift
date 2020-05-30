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
        let subCategoryName = dataSource?.data![indexPath.row].subCategoryName
        let subCategoryId = dataSource?.data![indexPath.row].subCategoryId
        
        completionHandler!(subCategoryName!, subCategoryId!)
        defaultValues.set(indexPath.row, forKey: Keys.selectedSubCategory)
        
        navigationController?.popToRootViewController(animated: true)
    }
}
