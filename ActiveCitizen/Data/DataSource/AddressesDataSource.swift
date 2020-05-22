//
//  DistrictsDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import CoreLocation

class AddressesDataSource: BaseDataSource {

    private let manager = AddressesManager()
    private(set) var data: [Address]?

    var completionHandler: ((_ geocode: String?) -> Void)?
    
    override func setup() {
        super.setup()
    }

    override func reload() {
        
        onLoading?(true)
        
        completionHandler = { geocode in
            
            self.manager.getAddresses(for: geocode!) { (result, error) in
                
                self.onLoading?(false)
                if error != nil {
                    self.onError?(error!)
                    return
                }

                self.data = result
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: AddressesTableViewCell.identifier)! as! AddressesTableViewCell
        
        cell.data = data![indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}
