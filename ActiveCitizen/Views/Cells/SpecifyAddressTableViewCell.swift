//
//  SpecifyAddressTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 07.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SpecifyAddressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityStateCountryAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var mapPin: UIImageView!
    @IBOutlet weak var shadowLayer: UIView!
    @IBOutlet weak var eachCell: UIButton!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 16, bottom: 8, right: 16))
        shadowLayer.layer.cornerRadius = 12
    }
    
    func setDataForCell(street: String, city: String) {
        cityStateCountryAddress.text = city
        streetAddress.text = street
    }

}
