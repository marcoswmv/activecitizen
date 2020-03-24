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

    @IBOutlet weak var reportCellView: ReportCellView!
    
    var data: Report? {
        didSet {
            reportCellView.categoryIcon.image = data?.categoryIcon
            reportCellView.categoryName.text = data?.categoryName
            reportCellView.subCategoryName.text = data?.subcategoryName
            reportCellView.address.text = data?.address
            reportCellView.photos = data?.photos

            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            let date = dateFormatter.string(from: (data?.created)!).replacingOccurrences(of: "/", with: ".")
            
            reportCellView.dateOfCreation.text = date
            
            switch data?.status {
            case "taskModeration":
                reportCellView.status.text = "На модерации"
                reportCellView.status.textColor = .orange
            case "taskAcceptance":
                reportCellView.status.text = "Принято в обработку"
                reportCellView.status.textColor = UIColor(named: "App Blue")
            case "taskEnterResult":
                reportCellView.status.text = ""
                reportCellView.status.textColor = .black
            case "taskPerformanceEvaluation":
                reportCellView.status.text = ""
                reportCellView.status.textColor = .black
            case "taskRejected":
                reportCellView.status.text = "Отклонено"
                reportCellView.status.textColor = .orange
            case "taskClosed":
                reportCellView.status.text = "Работа выполнена"
                reportCellView.status.textColor = .green
            case "taskAll":
                break
            default:
                break
            }
            
            if let number = data?.photos?.count {
                reportCellView.numberOfPhotos.text = "\(number)"
            } else {
                reportCellView.photosButton.isHidden = true
                reportCellView.numberOfPhotos.isHidden = true
            }
        }
    }
}
