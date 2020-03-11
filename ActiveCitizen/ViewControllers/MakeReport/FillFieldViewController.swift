//
//  FillFieldViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 17.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import MaterialComponents

class FillFieldViewController: BaseFillFieldViewController {
    
    @IBOutlet weak var textFieldToFill: MDCTextField!
    
    @IBAction func returnOnPrimaryActionTriggered(_ sender: UITextField) {
        completionHandler!(sender.text!)
        navigationController?.popViewController(animated: true)
    }
    
    var textFieldToFillController: MDCTextInputControllerFilled?

    var navigationBarTitle: String? = nil
    var textFieldPlaceholder: String? = nil
    var completionHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(with: navigationBarTitle!, icon: "back")
        setupTextField()
    }
    
    func setupTextField() {
        textFieldToFill.becomeFirstResponder()
        textFieldToFillController = MDCTextInputControllerFilled(textInput: textFieldToFill)
        textFieldToFillController?.placeholderText = textFieldPlaceholder
        textFieldToFillController?.floatingPlaceholderActiveColor = UIColor(named: "App Blue")
        textFieldToFillController?.roundedCorners = .init()
        textFieldToFillController?.activeColor = UIColor(named: "App Blue")
        textFieldToFillController?.textInput?.textColor = .darkGray
        textFieldToFillController?.textInput?.font = UIFont(name: UIFont.regularFontFmily, size: 17.0)
    }
    
}
