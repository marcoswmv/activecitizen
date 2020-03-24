//
//  User.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class Member {
    
    var id: Int?
    var name: String?
    var activeApplications: Int?
    var solvedProblems: Int?
    var rejectedApplications: Int?
    var photo: UIImage?
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as? Int
        name = dictionary["fio"] as? String
        activeApplications = dictionary["active"] as? Int
        solvedProblems = dictionary["completed"] as? Int
        rejectedApplications = dictionary["rejected"] as? Int
        photo = UIImage(named: "placeholder")
    }
    
}
