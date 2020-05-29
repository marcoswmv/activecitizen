//
//  MoreViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class MoreViewController: BaseMoreViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Ещё")
        setupNavigationBarShadow(activate: true)
    }
}
