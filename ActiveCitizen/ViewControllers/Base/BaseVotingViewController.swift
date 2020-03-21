//
//  BaseVotingViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 05.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseVotingViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "More"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomBackButton(with: "Опросы и голосования", icon: "back")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarShadow(activate: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        setupNavigationBarShadow(activate: true)
    }
}
