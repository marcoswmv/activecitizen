//
//  ReportsTableViewController+SegmentedControl.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 22.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

extension ReportsListContainerViewController: MDCTabBarDelegate {
    
    func setupSegmentedControl() {
        segmentedControl.items = [ UITabBarItem(title: "СПИСОК", image: nil, tag: 0),
                                   UITabBarItem(title: "КАРТА", image: nil, tag: 1)]
        
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
                listContainerView.isHidden = false
                mapContainerView.isHidden = true
            case 1:
                listContainerView.isHidden = true
                mapContainerView.isHidden = false
            default:
                break
        }
    }
    
}
