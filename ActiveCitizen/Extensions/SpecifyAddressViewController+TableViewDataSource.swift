//
//  SpecifyAddressViewController+TableViewDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 07.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import Foundation
import UIKit

extension SpecifyAddressViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    there's only one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testStreets.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell") as! SpecifyAddressTableViewCell

        cell.setDataForCell(street: testStreets[indexPath.row], city: testCities[indexPath.row])
        
        cell.contentView.cornerRadius = 12
        cell.contentView.clipsToBounds = true
        cell.eachCell.cornerRadius = 12
        cell.eachCell.clipsToBounds = true

        cell.selectionStyle = .none
        
        if cell.isSelected {
            cell.shadowLayer.isHidden = true
            cell.streetAddress.textColor = .black
            cell.backgroundColor = .white
            cell.contentView.borderColor = .gray
            cell.contentView.borderWidth = 1
        }
        
        return cell
    }
}
