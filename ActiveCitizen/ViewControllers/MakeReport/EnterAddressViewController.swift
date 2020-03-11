//
//  SpecifyAddressViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 06.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import CoreLocation

class EnterAddressViewController: BaseEnterAddressViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func enterAddressManuallyOnTouchUpInside(_ sender: Any) {
        let enterAddressManuallyViewController = EnterAddressManuallyViewController.instantiate() as! EnterAddressManuallyViewController
        
        enterAddressManuallyViewController.completionHandler = { addressDictionary in
            if let returnedStreet = addressDictionary["street"],
                let returnedHouse = addressDictionary["house"],
                let returnedCity = addressDictionary["locality"],
                let returnedDistrict = addressDictionary["province"] {
            
                let street = returnedStreet != "" ? "\(returnedStreet)" : ""
                let house = returnedHouse != "" ? "+\(returnedHouse)" : ""
                let city = returnedCity != "" ? "+\(returnedCity)" : ""
                let district = returnedDistrict != "" ? "+\(returnedDistrict)" : ""
                
                print("City: ", city, district)
                self.address = "\(street)\(house)\(city)\(district)"
            }
            
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(enterAddressManuallyViewController, animated: true)
    }
    
    var completionHandler: ((String?, String?) -> Void)?
    var selectedCity: String?
    var selectedStreet: String?
    var selectedCell: AddressesTableViewCell? = nil
    
    var dataSource: AddressesDataSource?
    
    var address: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataSource()
        tableView.separatorStyle = .none
    }
    
    func setupDataSource() {
        dataSource = AddressesDataSource(tableView: self.tableView)
        dataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        
        dataSource?.reload()
    }
}
