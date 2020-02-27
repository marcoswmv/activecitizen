//
//  SubCategory.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SubCategory {
    
    var categoryId: Int?
    var subCategoryId: Int?
    var subCategoryName: String?
    
    init(dictionary: [String: Any]) {
        categoryId = dictionary["parentId"] as? Int
        subCategoryId = dictionary["id"] as? Int
        subCategoryName = dictionary["name"] as? String
    }
}
