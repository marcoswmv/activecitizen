//
//  Vote.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 11.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class Vote {
    
    var id: Int?
    var message: String?
    var date: Date?
    
//    Check for the right parameters to get data from the server
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? Int
        self.message = dictionary["message"] as? String
        self.date = (dictionary["date"] as? String)?.parseISO8601()
    }
}
