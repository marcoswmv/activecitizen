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

    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    
    var defaultValues = UserDefaults.standard
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setCustomCellStyle()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setCustomCellStyle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 16, left: 18, bottom: 6, right: 18))
    }
}
