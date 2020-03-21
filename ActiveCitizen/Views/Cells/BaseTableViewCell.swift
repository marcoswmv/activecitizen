//
//  BaseTableViewCell.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    class var identifier: String {
        get {
            return String(describing: self)
        }
    }

    func setCustomCellStyle(for subContentView: UIView) {
        // add shadow to the cell
        subContentView.backgroundColor = .clear // very important
        subContentView.layer.masksToBounds = false
        subContentView.layer.shadowOpacity = 0.2
        subContentView.layer.shadowRadius = 4
        subContentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        subContentView.layer.shadowColor = UIColor.black.cgColor

        // add corner radius to the `contentView`
        subContentView.backgroundColor = .white
        subContentView.layer.cornerRadius = 12
    }
    
    func setCustomStyleOnSelection(for subContentView: UIView) {
        // add shadow to the cell
        subContentView.backgroundColor = .clear // very important
        subContentView.layer.shadowOpacity = 0
        subContentView.layer.shadowRadius = 0

        // add corner radius on `contentView`
        subContentView.borderColor = UIColor(named: "Separator Line Gray")
        subContentView.borderWidth = 1
        subContentView.backgroundColor = .white
        subContentView.layer.cornerRadius = 12
    }
    
}
