//
//  ReportsListViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListViewController: BaseReportsListViewController {

    let manager = ReportsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.getReportsList { (result, error) in
            
            if error != nil {
                print(error!)
            }else {
                print(result!)
            }
        }
    }
}
