//
//  ReportsListContainerViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListContainerViewController: BaseReportsListViewController {

    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var listContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func modeSegmentedControlValueChanged(_ sender: Any) {
        
        let showList = modeSegmentedControl.selectedSegmentIndex == 0
        mapContainerView.isHidden = showList
        listContainerView.isHidden = !showList
    }
    
}
