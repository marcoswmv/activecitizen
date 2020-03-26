//
//  SpecifyAddressTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 07.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class AddressesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var addressCellView: AddressCellView!
    @IBOutlet weak var selectedAddressCellView: SelectedAddressCellView!
    
    var data: Address? {
        didSet {
            addressCellView.cityAddress.text = data?.city
            addressCellView.streetAddress.text = data?.street
            
            selectedAddressCellView.cityAddress.text = data?.city
            selectedAddressCellView.streetAddress.text = data?.street
        }
    }
}
