//
//  ReportsListViewController+HideTabBar.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 11.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension ReportsListViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            
            searchBarTopConstraint.constant = 0
            hidingViews.forEach { $0.isHidden = true }
            hidingBar.hide(animated: true, completion: nil)
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            
            searchBarTopConstraint.constant = 44
            hidingViews.forEach { $0.isHidden = false }
            hidingBar.show(animated: true, completion: nil)
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}
