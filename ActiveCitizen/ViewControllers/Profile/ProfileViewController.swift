//
//  ProfileViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

class ProfileViewController: BaseProfileViewController {
    
    @IBOutlet weak var userInformationView: UserInformationView!
    @IBOutlet weak var segmentedControl: MDCTabBar!
    
    var user: Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentedControl()
        setupUserInformation()
        hideNavigationBar = true
    }
    
    func setupUserInformation() {
        userInformationView.photo.image = UIImage(named: "placeholder")
        userInformationView.fullName.setTitle("Александр Филинков Юрьевич", for: .normal)
        userInformationView.cityAddress.text = "Одинцовский городской округ"
        userInformationView.streetAddress.text = "104 место по району/округу"
    }
}
