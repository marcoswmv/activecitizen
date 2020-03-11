//
//  User.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class User {
    
//    TODO: Add another parameters as soon as the server reconnects back
    var name: String?
    var photo: UIImage?
    var solvedProblems: Int?
    var applications: Int?
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        photo = dictionary["photo"] as? UIImage
        solvedProblems = dictionary["solved-problems"] as? Int
        applications = dictionary["applications"] as? Int
    }
    
}
