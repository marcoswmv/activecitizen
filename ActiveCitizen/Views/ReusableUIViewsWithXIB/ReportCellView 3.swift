//
//  ExampleUIViewWithXib.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit


@IBDesignable
class ReportCellView: UIViewWithXib {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var numberOfPhotos: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var subCategoryName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var dateOfCreation: UILabel!
    
}
