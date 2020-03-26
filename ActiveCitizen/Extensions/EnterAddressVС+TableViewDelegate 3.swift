//
//  SpecifyAddressViewController+TableViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 07.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import Foundation
import UIKit

extension EnterAddressViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
        defaultValues.set(row, forKey: Keys.selectedAddress)
        
        selectedStreet = dataSource?.data?[row].street
        selectedCity = dataSource?.data?[row].city
        
        completionHandler?(selectedStreet, selectedCity)
        
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! AddressesTableViewCell
        
        if let selectedRow = defaultValues.value(forKey: Keys.selectedAddress) as? Int, selectedRow == indexPath.row {
            
            cell.selectedAddressCellView.isHidden = false
            cell.addressCellView.isHidden = true
            
        } else {
            
            cell.selectedAddressCellView.isHidden = true
            cell.addressCellView.isHidden = false
        }
    }
    
}
