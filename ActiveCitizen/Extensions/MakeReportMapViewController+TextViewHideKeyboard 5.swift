//
//  BaseViewController+TextViewKeyboard.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension MakeReportMapViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
       view.endEditing(true)
    }
    
}
