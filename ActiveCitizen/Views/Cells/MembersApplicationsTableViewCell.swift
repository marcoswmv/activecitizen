//
//  UserApplicationTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 16.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Foundation

class MembersApplicationsTableViewCell: BaseTableViewCell {

    @IBOutlet weak var subContentView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var numberOfImages: UILabel!
    @IBOutlet weak var subCategoryName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    var data: Report? {
        didSet {
            icon.image = UIImage()
            categoryName.text = data?.categoryName
            subCategoryName.text = data?.subcategoryName
            address.text = data?.address
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            let date = dateFormatter.string(from: (data?.created)!).replacingOccurrences(of: "/", with: ".")
            
            self.date.text = date
            
            switch data?.status {
            case "taskModeration":
                status.text = "На модерации"
                status.textColor = .orange
            case "taskAcceptance":
                status.text = "Принято в обработку"
                status.textColor = UIColor(named: "App Blue")
            case "taskEnterResult":
                status.text = ""
                status.textColor = .black
            case "taskPerformanceEvaluation":
                status.text = ""
                status.textColor = .black
            case "taskRejected":
                status.text = "Отклонено"
                status.textColor = .orange
            case "taskClosed":
                status.text = "Работа выполнена"
                status.textColor = .green
            case "taskAll":
                break
            default:
                break
            }
            
            if let number = data?.photos?.count {
                numberOfImages.text = "\(number)"
            } else {
                photosButton.isHidden = true
                numberOfImages.isHidden = true
            }
        }
    }
}
