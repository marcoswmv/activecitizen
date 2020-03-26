//
//  UITabBarController+CustomTabBar.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 20.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension UITabBarController {
    func setTabBarShadow() {
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: -1, width: self.tabBar.frame.size.width, height: 1)
        view.backgroundColor = .white
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: -4)
        view.layer.shadowOpacity = 0.4
        view.layer.shadowColor = UIColor.black.cgColor
        
        self.tabBar.addSubview(view)
        self.tabBar.barTintColor = .white
    }
}
