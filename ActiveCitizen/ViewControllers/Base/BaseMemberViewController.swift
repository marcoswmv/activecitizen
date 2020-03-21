//
//  BaseUserViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 13.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseMemberViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "Members"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(with: "Участник", icon: "back")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarShadow(activate: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        setupNavigationBarShadow(activate: true)
    }

}
