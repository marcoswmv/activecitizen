//
//  Date+Formatter.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 04.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension Date {
    
    func string(format: String = "yyyy.MM.dd HH:mm") -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
}
