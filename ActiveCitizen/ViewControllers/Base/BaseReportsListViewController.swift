//
//  BaseReportsListViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit

class BaseReportsListViewController: BaseViewController {
    
    override class func storyboardName() -> String? {
        return "ReportsList"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Обращения")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarShadow(activate: false)
    }
}
