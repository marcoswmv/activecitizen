//
//  EnterAddressManuallyVC+TableViewDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 17.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension EnterAddressManuallyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell")!
            
            region = cell.detailTextLabel?.text
            cell.textLabel?.text = "Район/Округ"
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell")!
            
            city = cell.detailTextLabel?.text
            cell.textLabel?.text = "Населенный пункт"
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StreetCell")!
            
            street = cell.detailTextLabel?.text
            cell.textLabel?.text = "Улица"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DomCell")!
            
            dom = cell.detailTextLabel?.text
            cell.textLabel?.text = "Дом"
            
            return cell
        }
    }
}
