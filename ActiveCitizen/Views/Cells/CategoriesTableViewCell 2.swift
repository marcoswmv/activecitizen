//
//  CategoriesTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var data: Category? {
        didSet {
            self.iconImage.image = data?.categoryIcon
            self.nameLabel.text = data?.categoryName
            self.accessoryView = UIImageView(image: UIImage.disclosure)
        }
    }
}
