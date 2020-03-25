//
//  ReportDetailsViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportDetailsViewController: BaseReportDetailsViewController {

    var report: Report?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if report == nil {
            print("TODO: error")
            self.navigationController?.popViewController(animated: true)
            return
        }
    }
}
