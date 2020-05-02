//
//  NotificationView.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 31.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class NotificationView: UIViewWithXib {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var subCategoryName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var statusChangedTo: UILabel!
    @IBOutlet weak var notificationMessage: UILabel!
    
    
    @IBAction func declineOnTouchUpInside(_ sender: Any) {
        print("Declining...")
    }
    
    @IBAction func approveOnTouchUpInside(_ sender: Any) {
        print("Approving...")
    }
}
