//
//  MakeReportMapVС+MapObjectTapListener.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 11.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit

extension MakeReportMapViewController: YMKMapInputListener {
    func onMapTap(with map: YMKMap, point: YMKPoint) {
        let showAddressOnMapViewController = ShowAddressOnMapViewController.instantiate() as! ShowAddressOnMapViewController
        
        showAddressOnMapViewController.completionHandler = { street, city, location in
            self.streetAddress.text = street
            self.cityAddress.text = city
        }
        navigationController?.pushViewController(showAddressOnMapViewController, animated: true)
    }
    
    func onMapLongTap(with map: YMKMap, point: YMKPoint) {
    }
}
