//
//  ReportsListTableViewCell.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListTableViewCell: BaseTableViewCell {

    @IBOutlet weak var reportCellView: ReportView!
    
    var taskStatus = TaskStatus()
    
    var data: Report? {
        didSet {
            
            reportCellView.categoryIcon.image = data?.categoryIcon
            reportCellView.categoryName.text = data?.categoryName
            reportCellView.subCategoryName.text = data?.subcategoryName
            reportCellView.address.text = data?.address
            reportCellView.dateOfCreation.text = data?.created?.string(format: "dd.MM.yyyy")
            reportCellView.images = data?.imagesIDs
            
            reportCellView.status.text = taskStatus.setStatus(statusKey: data?.status)
            reportCellView.status.textColor = taskStatus.setColor(statusKey: data?.status)
            
            
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
