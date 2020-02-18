//
//  SpecifyAddressTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 07.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

struct Keys {
    static var selectedCell = "selectedCell"
    static var selectedCellRow = "selectedCellRow"
}

class EnterAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var subContentView: UIView!
    @IBOutlet weak var mapPin: UIImageView!
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    
    var defaultValues = UserDefaults.standard
    
    func setCustomCellStyle() {
        // add shadow on cell
        subContentView.backgroundColor = .clear // very important
        subContentView.layer.masksToBounds = false
        subContentView.layer.shadowOpacity = 0.2
        subContentView.layer.shadowRadius = 4
        subContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        subContentView.layer.shadowColor = UIColor.black.cgColor

        // add corner radius on `contentView`
        subContentView.backgroundColor = .white
        subContentView.layer.cornerRadius = 12
    }
    
    func setCustomStyleOnSelection() {
        // add shadow on cell
        subContentView.backgroundColor = .clear // very important
        subContentView.layer.shadowOpacity = 0
        subContentView.layer.shadowRadius = 0

        // add corner radius on `contentView`
        subContentView.backgroundColor = .white
        subContentView.borderColor = UIColor(red: 211/255, green: 219/255, blue: 230/255, alpha: 1.0)
        subContentView.borderWidth = 1
        subContentView.layer.cornerRadius = 12
    }
    
}
