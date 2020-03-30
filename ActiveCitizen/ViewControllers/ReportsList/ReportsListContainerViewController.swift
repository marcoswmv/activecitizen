//
//  ReportsListContainerViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTabs

class ReportsListContainerViewController: BaseReportsListViewController {

    @IBOutlet weak var segmentedControl: MDCTabBar!
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var listContainerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentedControl()
        setupNavigationBarElements()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupNavigationBarElements() {
        let filterButton = UIBarButtonItem(image: UIImage(named: "filter")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleFilter))
        
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func handleFilter() {
        print("Showing filters")
    }
}
