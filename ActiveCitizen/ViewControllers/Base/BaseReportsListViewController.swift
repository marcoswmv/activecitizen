//
//  BaseReportsListViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseReportsListViewController: BaseViewController {
    
    override class func storyboardName() -> String? {
        return "ReportsList"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Обрашения")
        setupNavigationBarShadow(activate: false)
    }
}
