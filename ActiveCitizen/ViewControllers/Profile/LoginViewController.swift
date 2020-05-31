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
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarTitle(with: "Вход")
        setupNavigationBarShadow(activate: true)

        webView.navigationDelegate = self
        if let url = URL(string: "https://esia-portal1.test.gosuslugi.ru/idp/rlogin?cc=bp") {
            let request = URLRequest(url: url)
            webView.load(request)
            
        }
    }
    
    func getJSESSIONID() {
        webView.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            for cookie in cookies {
                if cookie.name == "JSESSIONID" {
                    print("JSESSIONID: ", cookie.value)
                }
            }
        }
    }
}

//MARK: - WEB VIEW'S DELEGATE TO DETECT WHEN A LOADING STARTS AND FINISHES
extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.displayLoading(loading: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.displayLoading(loading: false)
    }
}
