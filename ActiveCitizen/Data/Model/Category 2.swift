//
//  Category.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class Category {
    
    var categoryId: Int?
    var categoryName: String?
    var categoryIcon: UIImage?
    
    init(dictionary: [String: Any]) {
        categoryId = dictionary["id"] as? Int
        categoryName = dictionary["name"] as? String
        categoryIcon = getIcon(id: categoryId!)
    }
    
    func getIcon(id: Int) -> UIImage {
        switch id {
        case 1101:
            return UIImage.yardArea!
        case 1102:
            return UIImage.road!
        case 1103:
            return UIImage.water!
        case 1104:
            return UIImage.fire!
        case 1105:
            return UIImage.buildings!
        case 1106:
            return UIImage.publicTransport!
        case 1107:
            return UIImage.payments!
        case 1108:
            return UIImage.empty
        default:
            return UIImage()
        }
    }
}
