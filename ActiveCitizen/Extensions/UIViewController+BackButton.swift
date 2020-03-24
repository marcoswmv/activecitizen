//
//  UINavigationController+Shadow.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBarTitle(with textTitle: String) {
        let title = UILabel()
        title.text = textTitle
        title.font = .boldSystemFont(ofSize: 17.0)
        
        let navBarTitle = UIBarButtonItem(customView: title)
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 30.0

        navigationItem.leftBarButtonItems = [space, navBarTitle]
    }
    
    
    func setupCustomBackButton(with textTitle: String = "", icon iconName: String = "") {
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: iconName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.addTarget(self, action: #selector(handlePop), for: .touchUpInside)

        let title = UILabel()
        title.text = textTitle
        title.font = .boldSystemFont(ofSize: 17.0)

        let barButton = UIBarButtonItem(customView: backButton)
        let navBarTitle = UIBarButtonItem(customView: title)
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 30.0
        
        if !textTitle.isEmpty {
            navigationItem.leftBarButtonItems = [barButton, space, navBarTitle]
        } else {
            navigationItem.leftBarButtonItems = [barButton]
        }
        
    }
      
    @objc func handlePop() {
      navigationController?.popViewController(animated: true)
    }
}
