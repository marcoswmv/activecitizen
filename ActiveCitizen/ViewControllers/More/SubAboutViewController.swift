//
//  SubAboutViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 10.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SubAboutViewController: BaseViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.textContainerInset = UIEdgeInsets(top: 20, left: 15, bottom: 15, right: 15)
        textView.delegate = self
    }
}
