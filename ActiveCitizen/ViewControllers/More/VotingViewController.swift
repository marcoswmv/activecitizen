//
//  VotingViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

class VotingViewController: BaseVotingViewController {

    @IBOutlet weak var segmentedControl: MDCTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentedControl()
    }
    
}
