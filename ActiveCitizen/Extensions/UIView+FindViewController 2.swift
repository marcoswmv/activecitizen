//
//  UIView+FindViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
