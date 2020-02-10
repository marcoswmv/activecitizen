//
//  UIViewController+NavBarBackButton.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupCustomBackButton() {
        let backButton = UIButton(type: .system)
        backButton.setImage( UIImage(named: "back.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.addTarget(self, action: #selector(handlePop), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @objc func handlePop() {
        navigationController?.popViewController(animated: true)
    }
}
