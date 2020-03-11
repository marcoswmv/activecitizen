//
//  EnterAddressManuallyViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 14.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class EnterAddressManuallyViewController: BaseEnterAddressManuallyViewController {

    var district = ""
    var city = ""
    var street = ""
    var house = ""
    
    var completionHandler: (([String: String]) -> Void)?
    
    @IBAction func doneOnTouchUpInside(_ sender: Any) {
        
        let addressDictionary = ["street": street, "house": house, "locality": city, "province": district]
        
        completionHandler!(addressDictionary)
        
        self.navigationController?.popViewController(animated: true)
    }
}
