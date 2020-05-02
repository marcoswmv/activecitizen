//
//  ProgressTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 30.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class CommentTableViewCell: BaseTableViewCell {

    @IBOutlet weak var commentCellView: CommentView!
    
    var taskStatus = TaskStatus()
    
    var data: Comment? {
        didSet {
            if let status = data?.changedStatus {
                
                commentCellView.changedStatus.text = taskStatus.setStatus(statusKey: status)
                commentCellView.changedStatus.textColor = taskStatus.setColor(statusKey: status)

            } else {
                commentCellView.changedStatusLabel.isHidden = true
                commentCellView.changedStatus.isHidden = true
            }
            
            if let message = data?.message, message.contains(".") {
                commentCellView.message.text = message.replacingOccurrences(of: ". ", with: ".\n")
            } else {
                commentCellView.message.text = data?.message
            }
            
            
            if let firstName = data?.autorFirstName, let lastName = data?.autorLastName, let authority = data?.authority {
                commentCellView.autorLabel.text = authority + ":"
                commentCellView.autor.text = firstName + " " + lastName
            } else {
                commentCellView.autorLabel.isHidden = true
                commentCellView.autor.isHidden = true
            }
            commentCellView.publicationDate.text = data?.publicationDate?.string(format: "dd.MM.yyyy 'в' HH:mm").filter({ !$0.isUppercase })
        }
    }

}
