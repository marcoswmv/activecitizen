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
    
    var timer: Timer?
    
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.displayLoading(loading: false)
            Alert.showAlert(on: self, style: .alert,
                            title: "Ошибка",
                            message: "Приносим свои извинения!\nНа данный момент сервер не доступен следовательно, невозможно пройти авторизацию")
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.displayLoading(loading: false)
    }
}
