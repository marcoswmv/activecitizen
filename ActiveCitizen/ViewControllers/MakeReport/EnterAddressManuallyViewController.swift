//
//  EnterAddressManuallyViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 14.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class EnterAddressManuallyViewController: BaseMakeReportViewController {

    var region: String? = nil
    var city: String? = nil
    var street: String? = nil
    var dom: String? = nil
    
    var completionHandler: ((String, String) -> Void)?
    
    @IBAction func doneOnTouchUpInside(_ sender: Any) {
        let cityAddress = "\(String(describing: city)), \(String(describing: region))"
        let streetAddress = "\(String(describing: street)), \(String(describing: dom))"
        
        if let passData = completionHandler {
            passData(streetAddress, cityAddress)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(titleText: "Укажите адрес")
        setupNavigationBarShadow()
    }
}
