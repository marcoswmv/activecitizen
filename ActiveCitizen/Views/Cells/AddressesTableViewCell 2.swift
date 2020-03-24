//
//  SpecifyAddressTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 07.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class AddressesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var subContentView: UIView!
    @IBOutlet weak var mapPin: UIImageView!
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    
    var data: Address? {
        didSet {
            cityAddress.text = data?.city
            streetAddress.text = data?.street
        }
    }
}
