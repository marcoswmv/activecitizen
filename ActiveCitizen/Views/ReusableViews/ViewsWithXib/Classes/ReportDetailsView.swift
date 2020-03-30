//
//  ReportDetailsView.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class ReportDetailsView: UIViewWithXib {

    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var subCategoryName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var indicatedPeriod: UILabel!
    @IBOutlet weak var reportCreatedDate: UILabel!
    @IBOutlet weak var numberOfReport: UILabel!
    @IBOutlet weak var autor: UILabel!
    @IBOutlet weak var reportDescription: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func addCommentsOnTouchUpInside(_ sender: Any) {
        
        print("Adding new comments...")
    }
    
}
