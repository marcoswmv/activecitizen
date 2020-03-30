//
//  ProgressTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 30.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class ProgressTableViewCell: BaseTableViewCell {

    @IBOutlet weak var progressView: ProgressView!
    
    var data: Report? {
        didSet {
//            progressView.publicationDate.text = data?.created?.string(format: "dd.MM.yyyy 'в' HH:mm")
        }
    }

}
