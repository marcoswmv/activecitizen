//
//  BaseEnterAddressManuallyViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseEnterAddressManuallyViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "MakeReport"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomBackButton(with: "Укажите адрес", icon: "back")
        setupNavigationBarShadow(activate: true)
        self.hideTabBar = true
    }

}
