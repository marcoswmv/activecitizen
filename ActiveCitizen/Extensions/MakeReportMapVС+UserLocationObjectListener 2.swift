//
//  MakeReportMapVС+UserLocationObjectListener.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit

extension MakeReportMapViewController: YMKUserLocationObjectListener {
    func onObjectRemoved(with view: YMKUserLocationView) {
    }
    
    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) {
    }
    
    func onObjectAdded(with view: YMKUserLocationView) {
        let pinPlacemark = view.pin.useCompositeIcon()
        pinPlacemark.setIconWithName("map_pin_green",
                                     image: UIImage(named:"map_pin_green")!,
                                     style: YMKIconStyle(anchor: CGPoint(x: 0.5, y: 0.8) as NSValue,
                                                         rotationType:YMKRotationType.rotate.rawValue as NSNumber,
                                                         zIndex: 1,
                                                         flat: true,
                                                         visible: true,
                                                         scale: 1,
                                                         tappableArea: nil))
    }
}
