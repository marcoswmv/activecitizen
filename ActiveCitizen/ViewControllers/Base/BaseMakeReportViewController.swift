//
//  BaseMakeReportViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseMakeReportViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "MakeReport"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Сообщить")
        setupNavigationBarShadow(activate: true)
    }

}
