//
//  UIApplication+Loading.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIApplication {

    /// Display fullscreen loading indicator
    class func displayLoading(loading: Bool, color: UIColor = .white) {
    
        if loading {
            let config = ActivityData(size: CGSize(width: 40, height: 40), type: .ballPulse, color: color)
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(config)
        }else {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }

}
