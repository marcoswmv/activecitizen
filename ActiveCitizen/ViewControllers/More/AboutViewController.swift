//
//  AboutViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class AboutViewController: BaseMoreViewController {

    override func viewDidLoad() {
        
        setupCustomBackButton(with: "О программе", icon: "back")
        setupNavigationBarShadow(activate: true)
    }
}
