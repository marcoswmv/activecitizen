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
    @IBOutlet weak var reportCreationDate: UILabel!
    @IBOutlet weak var numberOfReport: UILabel!
    @IBOutlet weak var autorButton: UIButton!
    @IBOutlet weak var reportDescription: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var scrollContentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var userID: Int?
    
    @IBAction func addCommentsOnTouchUpInside(_ sender: Any) {
        Alert.showAlert(on: UIApplication.topViewController()!, style: .alert, title: "Функциональность недоступна", message: "В настоящее время невозможно добавлять комментарии")
    }
    
    @IBAction func openAutorsProfileOnTouchUpInside(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        profileViewController.user?.id = userID
        
        self.findViewController()?.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}
