//
//  EnterAddressManuallyViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 14.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class EnterAddressManuallyViewController: BaseMakeReportViewController {

    @IBOutlet weak var tableView: UITableView!
    var district: String?
    var city: String?
    var street: String?
    var house: String?
    
    var completionHandler: (([String: String]) -> Void)?
    var dataSource: AddressesDataSource?
    
    @IBAction func doneOnTouchUpInside(_ sender: Any) {
        
        let addressDictionary = ["street": street, "house": house, "locality": city, "province": district]
        
        completionHandler!(addressDictionary as! [String : String])
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomBackButton(with: "Укажите адрес", icon: "back")
        setupNavigationBarShadow(activate: true)
        self.hideTabBar = true
    }
}
