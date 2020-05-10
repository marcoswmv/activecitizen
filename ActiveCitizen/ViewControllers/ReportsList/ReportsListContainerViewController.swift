//
//  ReportsListContainerViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import Pageboy
import Tabman

class ReportsListContainerViewController: TabmanViewController {

    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    lazy var viewControllersList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "ReportsList", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "ReportsListViewController") as! ReportsListViewController
        let vc2 = storyboard.instantiateViewController(withIdentifier: "ReportsMapViewController") as! ReportsMapViewController
        return [ vc1, vc2]
    }()
    
    lazy var titles: [String] = [ "СПИСОК", "КАРТА"]
    
    let bar = TMBar.ButtonBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setupNavigationBarTitle(with: "Обращения")
        setupNavigationBarElements()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarShadow(activate: false)
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
    }
    
    func setupNavigationBarElements() {
        let filterButton = UIBarButtonItem(image: UIImage(named: "filter-stroke")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleFilter))
        
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func handleFilter() {
        print("Showing filters")
    }
    
    func setTabBar() {
        let reportsListVC = viewControllersList.first as! ReportsListViewController
        reportsListVC.hidingBar = bar.hiding(trigger: .manual)
        reportsListVC.hidingViews = [tabBarView, shadowView]
        setupTabBar(bar: bar, view: tabBarView, viewController: self, contentMode: .fit)
    }
}
