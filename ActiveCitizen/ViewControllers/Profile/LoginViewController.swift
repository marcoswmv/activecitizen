//
//  LoginViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 05.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: BaseProfileViewController {
    
    let webView = WKWebView()

    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Вход")
        setupNavigationBarShadow(activate: true)

//        if !authenticationRequired {
//            let profileViewController = ProfileViewController.instantiate() as! ProfileViewController
//            navigationController?.pushViewController(profileViewController, animated: true)
//        }

        if let url = URL(string: "https://esia-portal1.test.gosuslugi.ru") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}
