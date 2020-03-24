//
//  BaseImageViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseImageViewController: BaseViewController {

    
    override class func storyboardName() -> String? {
        return "ReportsList"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarShadow(activate: false)
        setupCustomBackButton(with: "", icon: "baseline_clear_white_18pt")
    }
}
