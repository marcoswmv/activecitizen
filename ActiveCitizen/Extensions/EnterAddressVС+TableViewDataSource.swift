//
//  SpecifyAddressViewController+TableViewDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 07.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import Foundation
import UIKit

extension EnterAddressViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testStreets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell") as! EnterAddressTableViewCell
        
        cell.cityAddress.text = testCities[indexPath.row]
        cell.streetAddress.text = testStreets[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
}
