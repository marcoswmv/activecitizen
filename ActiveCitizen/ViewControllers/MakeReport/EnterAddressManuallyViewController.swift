//
//  EnterAddressManuallyViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 14.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class EnterAddressManuallyViewController: UIViewController {

    @IBOutlet weak var districtLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var streetLabel: UITextField!
    @IBOutlet weak var domLabel: UITextField!
    
    var completionHandler: ((String, String) -> Void)?
    
    @IBAction func enterAddressManuallyOnTouchUpInside(_ sender: Any) {
        let cityAddress = "\(String(describing: cityLabel.text)), \(String(describing: districtLabel.text))"
        let streetAddress = "\(String(describing: streetLabel.text)), \(String(describing: domLabel.text))"
        
        if let passData = completionHandler {
            let rootVC = MakeReportMapViewController()
            passData(streetAddress, cityAddress)
            self.navigationController?.popToViewController(rootVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(titleText: "Укажите адрес")
        setupNavigationBarShadow()
    }
}
