//
//  AboutViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class AboutViewController: TabmanViewController {
    
    @IBOutlet weak var tabBarView: UIView!
    
    private var viewControllers = [InstructionsViewController(), AgreementsViewController(),
                                   RegulationsViewController(), FAQViewController()]
    
    override func viewDidLoad() {
        
        setupCustomBackButton(with: "О программе", icon: "back")
        setupNavigationBarShadow(activate: true)
        
        setupTabBar()
    }
    
    func setupTabBar() {
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize

        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tabBarView, layout: nil))
    }
}

extension AboutViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = viewControllers[index].title?.uppercased()
        print(title)
        
        return TMBarItem(title: "")
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for tabViewController: TabmanViewController, at index: Int) -> TMBarItemable {
        return TMBarItem(title: "")
    }
}
