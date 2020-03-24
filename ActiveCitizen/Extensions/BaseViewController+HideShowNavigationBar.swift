//
//  BaseViewController+Hide:ShowNavigationBar.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension BaseViewController {
    
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
        navigationController?.view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
}
