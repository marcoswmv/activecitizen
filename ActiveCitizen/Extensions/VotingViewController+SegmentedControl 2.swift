//
//  VotingViewController+SegmentedControl.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 05.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

extension VotingViewController: MDCTabBarDelegate {
    
    func setupSegmentedControl() {
        segmentedControl.items = [UITabBarItem(title: "ВСЕ", image: nil, tag: 0),
                                  UITabBarItem(title: "НОВЫЕ", image: nil, tag: 1),
                                  UITabBarItem(title: "ЗАВЕРШЕННЫЕ", image: nil, tag: 2)]
        
        segmentedControl.delegate = self
        segmentedControl.itemAppearance = .titles
        segmentedControl.alignment = .leading
        segmentedControl.displaysUppercaseTitles = true
        segmentedControl.backgroundColor = .white
        segmentedControl.tintColor = UIColor(named: "SC Line Blue")
        segmentedControl.selectedItemTintColor = UIColor(named: "SC Title Blue")
        segmentedControl.unselectedItemTintColor = .black
        segmentedControl.selectedItemTitleFont = UIFont(name: UIFont.mediumFontFmily, size: 13.0)!
        segmentedControl.unselectedItemTitleFont = UIFont(name: UIFont.mediumFontFmily, size: 13.0)!
    }
    
    func tabBar(_ tabBar: MDCTabBar, didSelect item: UITabBarItem) {
        switch item.tag {
            case 0:
                print("ВСЕ")
            case 1:
                print("НОВЫЕ")
            case 2:
                print("ЗАВЕРШЕННЫЕ")
            default:
                return
        }
    }
}
