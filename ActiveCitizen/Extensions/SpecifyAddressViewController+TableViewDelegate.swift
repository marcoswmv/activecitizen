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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(130.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = (tableView.cellForRow(at: indexPath) as! EnterAddressTableViewCell)
        
        if let cell = selectedCell, cell.isSelected {
            cell.defaultValues.set(true, forKey: Keys.selectedCell)
            cell.defaultValues.set(indexPath.row, forKey: Keys.selectedCellRow)
            cell.setCustomStyleOnSelection()
        }
        
        // Data for test
        let row = indexPath.row
        selectedCity = testCities[row]
        selectedStreet = testStreets[row]
        
        if let passData = completionHandler, !selectedCity!.isEmpty, !selectedStreet!.isEmpty {
            passData(selectedStreet!, selectedCity!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        
        selectedCell = cell as? EnterAddressTableViewCell
        
        guard let wasSelected = selectedCell!.defaultValues.value(forKey: Keys.selectedCell) as? Bool else { return }
        guard let selectedCellRow = selectedCell!.defaultValues.value(forKey: Keys.selectedCellRow) as? Int else { return }
        
        if selectedCellRow == indexPath.row && wasSelected {
            cell.setCustomStyleOnSelection()
            selectedCell?.streetAddress.textColor = .black
        }
    }
    
}
