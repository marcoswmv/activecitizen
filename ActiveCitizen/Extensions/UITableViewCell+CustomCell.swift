//
//  UITableViewCell+CustomCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 12.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func setCustomCellStyle() {
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.black.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
    }
    
    func setCustomStyleOnSelection() {
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.shadowOpacity = 0
        layer.shadowRadius = 0

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.borderColor = .gray
        contentView.borderWidth = 1/2
        contentView.layer.cornerRadius = 12
    }
}
