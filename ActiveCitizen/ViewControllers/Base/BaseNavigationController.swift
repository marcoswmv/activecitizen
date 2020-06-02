//
//  BaseNavigationController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.interactivePopGestureRecognizer?.isEnabled = false
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
