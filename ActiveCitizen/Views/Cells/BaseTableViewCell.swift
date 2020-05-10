//
//  BaseTableViewCell.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    class var identifier: String {
        get {
            return String(describing: self)
        }
    }
}
