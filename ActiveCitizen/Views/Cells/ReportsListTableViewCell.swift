//
//  ReportsListTableViewCell.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportsListTableViewCell: BaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var data: Report? {
        didSet {
            titleLabel.text = data?.categoryName
        }
    }

}
