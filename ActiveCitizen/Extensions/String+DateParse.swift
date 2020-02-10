//
//  String+DateParse.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 04.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension String {
    
    func parseISO8601() -> Date?  {
        
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: self) {
            return date
        }
        
        if let date = parse(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ") {
            return date
        }
        
        return nil
    }
    
    func parse(format: String) -> Date? {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from:self)
    }
    
}
