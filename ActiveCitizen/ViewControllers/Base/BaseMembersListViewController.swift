//
//  BaseUsersViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseMembersListViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarTitle(with: "Участники")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarShadow(activate: true)
    }
    
}
