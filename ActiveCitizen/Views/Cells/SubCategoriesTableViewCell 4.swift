//
//  SubCategoriesTableViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class SubCategoriesTableViewCell: BaseTableViewCell {

    var data: SubCategory? {
        didSet {
            self.textLabel?.text = data?.subCategoryName
        }
    }
    
}
