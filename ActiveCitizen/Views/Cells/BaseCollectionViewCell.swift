//
//  BaseCollectionViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
}
