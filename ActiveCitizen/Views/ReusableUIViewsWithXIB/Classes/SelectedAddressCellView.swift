//
//  SelectedAddressCellView.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 23.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit


@IBDesignable
class SelectedAddressCellView: UIViewWithXib {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var subContentView: IBDesignableView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    
}
