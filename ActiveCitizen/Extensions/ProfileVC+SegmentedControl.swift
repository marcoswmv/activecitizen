//
//  ProfileVC+ TabBarDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 19.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

extension ProfileViewController: MDCTabBarDelegate {
    
    func setupSegmentedControl() {
        segmentedControl.items = [ UITabBarItem(title: "УВЕДОМЛЕНИЯ", image: nil, tag: 0),
                                   UITabBarItem(title: "ОБРАЩЕНИЯ", image: nil, tag: 1)]
        
        segmentedControl.delegate = self
        segmentedControl.itemAppearance = .titles
        segmentedControl.alignment = .justified
        segmentedControl.displaysUppercaseTitles = true
        segmentedControl.backgroundColor = .white
        segmentedControl.tintColor = UIColor(named: "SC Line Blue")
        segmentedControl.selectedItemTintColor = UIColor(named: "SC Title Blue")
        segmentedControl.unselectedItemTintColor = .black
        segmentedControl.selectedItemTitleFont = UIFont(name: UIFont.regularFontFmily, size: 15.0)!
        segmentedControl.unselectedItemTitleFont = UIFont(name: UIFont.regularFontFmily, size: 15.0)!
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
