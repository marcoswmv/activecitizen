//
//  MakeReportScrollView.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 10.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class MakeReportScrollView: UIScrollView {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        return point.y > 225
    }

}
