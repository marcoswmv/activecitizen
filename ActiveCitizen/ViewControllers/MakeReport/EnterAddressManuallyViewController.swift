//
//  EnterAddressManuallyViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 14.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class EnterAddressManuallyViewController: BaseViewController {

    var region = ""
    var city = ""
    var street = ""
    var dom = ""
    
    var completionHandler: ((String, String) -> Void)?
    
    @IBAction func doneOnTouchUpInside(_ sender: Any) {
        let cityAddress = "\(String(describing: city)), \(String(describing: region))"
        let streetAddress = "\(String(describing: street)), \(String(describing: dom))"
        
        completionHandler!(streetAddress, cityAddress)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(titleText: "Укажите адрес")
        setupNavigationBarShadow()
        self.hideTabBar = true
    }
}
