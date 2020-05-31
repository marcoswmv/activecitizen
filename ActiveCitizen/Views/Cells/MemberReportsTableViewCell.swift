//
//  UserApplicationTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 16.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Foundation

class MemberReportsTableViewCell: BaseTableViewCell {

    @IBOutlet weak var reportCellView: ReportView!
    
    var taskStatus = TaskStatus()
    
    var data: Report? {
        didSet {
            reportCellView.categoryIcon.image = data?.categoryIcon
            reportCellView.categoryName.text = data?.categoryName
            reportCellView.subCategoryName.text = data?.subcategoryName
            reportCellView.address.text = data?.address
            reportCellView.dateOfCreation.text = data?.created?.string(format: "dd.MM.yyyy")
            reportCellView.status.text = taskStatus.setStatus(statusKey: data?.status)
            reportCellView.status.textColor = taskStatus.setColor(statusKey: data?.status)
            reportCellView.images = data?.imagesIDs
            
            if data?.imagesIDs?.first == "" {
                reportCellView.photosButton.isHidden = true
                reportCellView.numberOfPhotos.isHidden = true
            } else {
                if let number = data?.imagesIDs?.count {
                    reportCellView.numberOfPhotos.text = "\(number)"
                } else {
                    reportCellView.photosButton.isHidden = true
                    reportCellView.numberOfPhotos.isHidden = true
                }
            }
        }
    }
}
