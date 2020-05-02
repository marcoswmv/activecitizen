//
//  UserDescriptionView.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 30.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class UserInformationView: UIViewWithXib {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var fullName: UIButton!
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var solvedProblems: UILabel!
    @IBOutlet weak var applications: UILabel!
    
    @IBAction func editUserInformationFromNameButtonOnTouchUpInside(_ sender: Any) {
        print("Editing info from name button...")
    }
    
    @IBAction func editUserInformationOnTouchUpInside(_ sender: Any) {
        print("Editing info...")
    }
}
