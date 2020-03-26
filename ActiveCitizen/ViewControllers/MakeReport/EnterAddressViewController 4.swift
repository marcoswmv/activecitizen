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
        
        if let cityAddress = self.cityAddress, let streetAddress = self.streetAddress {
            let cityAddressArray = cityAddress.split { $0 == "," }
            let streetAddressArray = streetAddress.split { $0 == "," }
            
            let city = String(cityAddressArray[0])
            let district = String(cityAddressArray[1])
            let street = String(streetAddressArray[0])
            let house = String(streetAddressArray[1])
            
            enterAddressManuallyViewController.city = city
            enterAddressManuallyViewController.district = district
            enterAddressManuallyViewController.street = street
            enterAddressManuallyViewController.house = house
        }
        
        
        enterAddressManuallyViewController.completionHandler = { addressDictionary in
            if let returnedStreet = addressDictionary["street"],
                let returnedHouse = addressDictionary["house"],
                let returnedCity = addressDictionary["locality"],
                let returnedDistrict = addressDictionary["province"] {
            
                let address = "\(returnedDistrict) \(returnedCity) \(returnedStreet) \(returnedHouse)".replacingOccurrences(of: " ", with: "+")
                
                self.setupDataSource(from: address)
            }
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(enterAddressManuallyViewController, animated: true)
    }
    
    var completionHandler: ((String?, String?) -> Void)?
    var defaultValues = UserDefaults.standard
    var selectedCity: String?
    var selectedStreet: String?
    
    var dataSource: AddressesDataSource?
    var location: CLLocation?
    var cityAddress: String?
    var streetAddress: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let location = self.location {
            let coordinates = "\(location.coordinate.longitude),\(location.coordinate.latitude)"
            setupDataSource(from: coordinates)
        }
        
        tableView.separatorStyle = .none
        layoutTableViewCells()
    }
    
    func setupDataSource(from geocode: String?) {
        dataSource = AddressesDataSource(tableView: self.tableView)
        dataSource?.onLoading = { isLoading in
            self.displayLoading(loading: isLoading)
        }
        
        dataSource?.reload()
        dataSource?.getGeocode?(geocode)
    }
    
    func layoutTableViewCells() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressesTableViewCell") as! AddressesTableViewCell
        
        cell.selectedAddressCellView.isHidden = true
        cell.addressCellView.isHidden = false
    }
}
