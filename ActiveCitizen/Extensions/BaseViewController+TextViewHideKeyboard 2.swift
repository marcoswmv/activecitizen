//
//  MembersListViewController+TextViewHideKeyboard.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 23.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension BaseViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
       view.endEditing(true)
    }
    
}
