//
//  District.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class Address {
    
    var city: String?
    var street: String?
    
    init(dictionary: [String: Any]) {
        city = dictionary["description"] as? String
        street = dictionary["name"] as? String
    }
}
