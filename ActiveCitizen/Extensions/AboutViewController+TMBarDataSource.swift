//
//  AboutViewController+TMBarDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

extension AboutViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllersList.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllersList[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        return TMBarItem(title: titles[index])
    }
    
}
