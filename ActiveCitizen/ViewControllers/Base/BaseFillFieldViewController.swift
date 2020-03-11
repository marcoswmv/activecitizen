//
//  BaseFillFieldViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseFillFieldViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "MakeReport"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarShadow(activate: true)
        self.tabBarController?.hidesBottomBarWhenPushed = true
        self.hideTabBar = true
    }
}
