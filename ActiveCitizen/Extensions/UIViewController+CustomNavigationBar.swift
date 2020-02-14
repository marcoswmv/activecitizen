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
        self.navigationController?.navigationBar.layer.shadowRadius = 5
    }
    
    func setupCustomBackButton(titleText: String = "") {
        let backButton = UIButton(type: .system)
        backButton.setImage( UIImage(named: "back.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.addTarget(self, action: #selector(handlePop), for: .touchUpInside)
        
        let title = UILabel()
        title.text = titleText
        title.font = .boldSystemFont(ofSize: 17.0)
        
        let barButton = UIBarButtonItem(customView: backButton)
        let navBarTitle = UIBarButtonItem(customView: title)
  
        navigationItem.leftBarButtonItems = [barButton, navBarTitle]
    }
    
    @objc func handlePop() {
        navigationController?.popViewController(animated: true)
    }
}
