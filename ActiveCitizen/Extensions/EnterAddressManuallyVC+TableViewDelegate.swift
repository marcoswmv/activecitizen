//
//  EnterAddressManuallyVC+TableViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 17.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension EnterAddressManuallyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fillFieldViewController = FillFieldViewController.instantiate() as! FillFieldViewController
        
        switch indexPath.row {
        case 0:
            fillFieldViewController.navigationBarTitle = "Район/Округ"
            fillFieldViewController.textFieldPlaceholder = "Район/Округ"
            fillFieldViewController.completionHandler = { region in
                self.district = region
                tableView.reloadData()
            }
        case 1:
            fillFieldViewController.navigationBarTitle = "Населенный пункт"
            fillFieldViewController.textFieldPlaceholder = "Населенный пункт"
            fillFieldViewController.completionHandler = { city in
                self.city = city
                tableView.reloadData()
            }
        case 2:
            fillFieldViewController.navigationBarTitle = "Улица"
            fillFieldViewController.textFieldPlaceholder = "Улица"
            fillFieldViewController.completionHandler = { street in
                self.street = street
                tableView.reloadData()
            }
        case 3:
            fillFieldViewController.navigationBarTitle = "Дом"
            fillFieldViewController.textFieldPlaceholder = "Дом"
            fillFieldViewController.completionHandler = { dom in
                self.house = dom
                tableView.reloadData()
            }
        default:
            break
        }
        
        navigationController?.pushViewController(fillFieldViewController, animated: true)
    }
    
}
