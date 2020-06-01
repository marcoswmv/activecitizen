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
    
//    MARK: - OUTLETS
    
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    
//    MARK: - PROPERTIES
    
    lazy var viewControllersList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "ReportsList", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "ReportsListViewController") as! ReportsListViewController
        let vc2 = storyboard.instantiateViewController(withIdentifier: "ReportsMapViewController") as! ReportsMapViewController
        return [ vc1, vc2]
    }()
    
    lazy var titles: [String] = [ "СПИСОК", "КАРТА"]
    let bar = TMBar.ButtonBar()
    
//    MARK: - METHODS
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
        let filterButton = UIBarButtonItem(image: UIImage(named: "filter-stroke")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleFilter(sender:)))
        
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func handleFilter(sender: UIBarButtonItem) {
        let filterCategoriesViewController = FilterCategoriesViewController.instantiate() as! FilterCategoriesViewController
        
        filterCategoriesViewController.completionHandler = { filter in
            Alert.showAlert(on: self, style: .alert, title: "Ошибка", message: "Приносим свои извинения!\nНа данный момент сервер не доступен следовательно, невозможно применить фильрты!")
//            sender.image = UIImage(named: "filter")?.withRenderingMode(.alwaysOriginal)
//            TODO: Use filter on reports list to display reports by filter.
//            self.setupDataSource(with: filter)
        }
        navigationController?.pushViewController(filterCategoriesViewController, animated:true)
    }
    
    func setTabBar() {
        let reportsListVC = viewControllersList.first as! ReportsListViewController
        reportsListVC.hidingBar = bar.hiding(trigger: .manual)
        reportsListVC.hidingViews = [tabBarView, shadowView]
        setupTabBar(bar: bar, view: tabBarView, viewController: self, contentMode: .fit)
    }
}
