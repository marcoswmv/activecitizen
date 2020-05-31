//
//  Alert.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 28.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class Alert {
    static func showAlert(on viewController: UIViewController,
                          style: UIAlertController.Style,
                          title: String?,
                          message: String?,
                          actions: [UIAlertAction] = [UIAlertAction(title: "",
                                                                    style: .cancel,
                                                                    handler: nil)],
                          completion: (() -> Void)? = nil) {
        
        let alert =  UIAlertController(title: title, message: message, preferredStyle: style)
        
        for action in actions {
            alert.addAction(action)
        }
        
        DispatchQueue.main.async { viewController.present(alert, animated: true, completion: completion) }
    }
}
