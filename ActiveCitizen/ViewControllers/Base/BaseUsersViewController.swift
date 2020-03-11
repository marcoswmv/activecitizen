//
//  BaseUsersViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseUsersViewController: BaseViewController {
    
    override class func storyboardName() -> String? {
        return "Участники"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(with: "Участники")
        setupNavigationBarShadow(activate: true)
    }
    
}
