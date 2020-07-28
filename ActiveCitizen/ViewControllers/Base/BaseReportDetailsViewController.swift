//
//  BaseReportDetailsViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseReportDetailsViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "ReportsList"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomBackButton(with: "Обрашение", icon: "back")
        setupNavigationBarShadow(activate: true)
    }

}
