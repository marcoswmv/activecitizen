//
//  BaseMakeReportViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseMakeReportViewController: BaseViewController {

    override class func storyboardName() -> String? {
        return "MakeReport"
    }

    func setupNavigationBarTitle() {
        let title = UILabel()
        title.text = "Сообщить"
        title.font = .boldSystemFont(ofSize: 17.0)
        
        let navBarTitle = UIBarButtonItem(customView: title)
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 30.0

        navigationItem.leftBarButtonItems = [space, navBarTitle]
    }
}
