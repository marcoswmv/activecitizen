//
//  BaseFilterCategoriesViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseFilterCategoriesViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "Members"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarShadow(activate: true)
        setupCustomBackButton(with: "Фильтр", icon: "back")
    }

}
