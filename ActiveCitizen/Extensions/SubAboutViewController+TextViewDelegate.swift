//
//  SubAboutViewController+TextViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 10.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension SubAboutViewController: UITextViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}
