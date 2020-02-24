//
//  UINavigationController+Shadow.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupCustomBackButton(titleText: String = "") {
          let backButton = UIButton(type: .system)
          backButton.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
          backButton.addTarget(self, action: #selector(handlePop), for: .touchUpInside)
          
          let title = UILabel()
          title.text = titleText
          title.font = .boldSystemFont(ofSize: 17.0)
          
          let barButton = UIBarButtonItem(customView: backButton)
          let navBarTitle = UIBarButtonItem(customView: title)
          let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
          space.width = 30.0
    
          navigationItem.leftBarButtonItems = [barButton, space, navBarTitle]
      }
      
      @objc func handlePop() {
          navigationController?.popViewController(animated: true)
      }
}
