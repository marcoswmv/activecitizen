//
//  BaseProfileViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseProfileViewController: BaseViewController {
    
    override class func storyboardName() -> String? {
        return "Profile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Профиль")
        setupNavigationBarShadow(activate: true)
    }

}
