//
//  BaseLoginViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 05.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseLoginViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "Profile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Вход")
        setupNavigationBarShadow(activate: true)
    }
}
