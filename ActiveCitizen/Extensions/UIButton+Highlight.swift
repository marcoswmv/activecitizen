//
//  UIButton+Highlight.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension UIButton {
    
    override open var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.25, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.alpha = self.isHighlighted ? 0.5 : 1
            }, completion: nil)
        }
    }
}
