//
//  UIViewController+NavBarBackButton.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavigationBarShadow() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowOffset = .zero
        self.navigationController?.navigationBar.layer.shadowRadius = 3
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}
