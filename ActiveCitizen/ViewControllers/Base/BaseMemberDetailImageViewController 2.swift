//
//  BaseMemberDetailImageViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseMemberDetailImageViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "Members"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarShadow(activate: false)
        setupCustomBackButton(with: "", icon: "baseline_clear_white_18pt")
    }

}
