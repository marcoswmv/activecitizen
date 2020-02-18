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
        let makeReportStoryboard = UIStoryboard(name: "MakeReport", bundle: nil)
        let fillFieldViewController = makeReportStoryboard.instantiateViewController(withIdentifier: "FillFieldViewController") as! FillFieldViewController
        
        switch indexPath.row {
        case 0:
            fillFieldViewController.navigationBarTitle = "Район/Округ"
        case 1:
            fillFieldViewController.navigationBarTitle = "Населенный пункт"
        case 2:
            fillFieldViewController.navigationBarTitle = "Улица"
        case 3:
            fillFieldViewController.navigationBarTitle = "Дом"
        default:
            break
        }
        
        navigationController?.pushViewController(fillFieldViewController, animated: true)
        
    }
    
}
