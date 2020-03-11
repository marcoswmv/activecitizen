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
    
    @IBOutlet weak var segmentedControl: MDCTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentedControl()
        hideNavigationBar = true
    }
    
    
    @IBAction func editNameOnTouchUpInside(_ sender: Any) {
        print("Editing name")
    }

}
