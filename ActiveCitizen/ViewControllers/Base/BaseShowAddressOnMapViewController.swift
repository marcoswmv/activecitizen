//
//  BaseShowAddressOnMapViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseShowAddressOnMapViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "MakeReport"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCustomBackButton(with: "", icon: "baseline_clear_black_18pt")
        setupNavigationBarShadow(activate: true)
    }
    
    func makeNavigationBarInvisible() {
//        Turn nav bar invisible
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    func makeNavigationBarVisible() {
//        Turn it visible
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }

}
