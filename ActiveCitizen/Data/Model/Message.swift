//
//  Message.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 29.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class Message {
    
    var userId: Int?
    var categoryId: Int?
    var subCategoryId: Int?
    var address: String?
    var coordinates: String?
    var description: String?
    var files: [String]?
    
    init(dictionary: [String: Any]) {
        userId = dictionary["userId"] as? Int
        categoryId = dictionary["categoryId"] as? Int
        subCategoryId = dictionary["subcategoryId"] as? Int
        address = dictionary["address"] as? String
        coordinates = dictionary["coordinates"] as? String
        description = dictionary["description"] as?  String
        files = dictionary["files"] as? [String]
    }
}
