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
    
    var data: Report? {
        didSet {
            
            reportCellView.categoryIcon.image = data?.categoryIcon
            reportCellView.categoryName.text = data?.categoryName
            reportCellView.subCategoryName.text = data?.subcategoryName
            reportCellView.numberOfPhotos.text = "\(data?.photos?.count ?? 0)"
            reportCellView.address.text = data?.address
            reportCellView.dateOfCreation.text = data?.created?.string(format: "dd.MM.yyyy")
            reportCellView.photos = data?.photos
            
            switch data?.status {
            case "taskModeration":
                reportCellView.status.text = "На модерации"
                reportCellView.status.textColor = .orange
            case "taskAcceptance":
                reportCellView.status.text = "Принято в обработку"
                reportCellView.status.textColor = UIColor(named: "App Blue")
            case "taskEnterResult":
                reportCellView.status.text = "Первичное рассмотрение исполнителем"
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
            
        }
    }

}
