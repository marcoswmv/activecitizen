//
//  TabmanViewController+SetupTabBar.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 10.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

extension TabmanViewController {
    
    func setupTabBar(bar: TMBar.ButtonBar, view: UIView, viewController: UIViewController, contentMode: TMBarLayout.ContentMode = .intrinsic) {
        
        self.dataSource = viewController as? PageboyViewControllerDataSource
        
        bar.layout.transitionStyle = .snap
        bar.layout.contentInset = contentMode == .intrinsic ? UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) : .zero
        bar.backgroundView.style = .clear
        bar.indicator.backgroundColor = .acBlue
        bar.indicator.weight = .light
        bar.layout.contentMode = contentMode

        bar.buttons.customize { (button) in
            button.tintColor = .acDarkGray
            button.selectedTintColor = .acBlue
            button.font = UIFont(name: UIFont.mediumFontFmily, size: 14.0)!
        }
        
        addBar(bar,
               dataSource: viewController as! TMBarDataSource,
               at: .custom(view: view, layout: nil))
    }
}
