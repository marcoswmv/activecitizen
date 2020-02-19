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
        selectedCell = (tableView.cellForRow(at: indexPath) as! EnterAddressTableViewCell)
        
        if let cell = selectedCell, cell.isSelected {
            cell.defaultValues.set(indexPath.row, forKey: Keys.selectedCellRow)
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
        let cell = cell as! EnterAddressTableViewCell
        selectedCell = cell
        
        if let selectedCellRow = selectedCell!.defaultValues.value(forKey: Keys.selectedCellRow) as? Int, selectedCellRow == indexPath.row {
            cell.setCustomStyleOnSelection()
            selectedCell?.streetAddress.textColor = .black
            selectedCell?.mapPin.image = UIImage(named: "map_pin")
        } else {
            cell.setCustomCellStyle()
        }
    }
    
}
