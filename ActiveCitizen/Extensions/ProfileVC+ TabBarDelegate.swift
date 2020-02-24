//
//  ProfileVC+ TabBarDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 19.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import RESegmentedControl
import MaterialComponents.MDCTabBar

extension ProfileViewController: MDCTabBarDelegate {
    func setSegmentedControl() {
        segmentedControl.items = [
            UITabBarItem(title: "УВЕДОМЛЕНИЯ", image: nil, tag: 0),
            UITabBarItem(title: "ОБРАЩЕНИЯ", image: nil, tag: 1)
        ]
        segmentedControl.itemAppearance = .titles
        segmentedControl.titleTextTransform = .uppercase
        segmentedControl.selectedItemTintColor = UIColor(named: "App Blue")
        segmentedControl.selectedItemTitleFont = UIFont(name: UIFont.regularFontFmily, size: 15.0)!
        segmentedControl.unselectedItemTintColor = .black
        segmentedControl.unselectedItemTitleFont = UIFont(name: UIFont.regularFontFmily, size: 15.0)!
        segmentedControl.alignment = .justified
    }
    
    func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            print("УВЕДОМЛЕНИЯ")
        case 1:
            print("ОБРАЩЕНИЯ")
        default:
            break
        }
    }

}
