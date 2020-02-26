//
//  MakeReportMapVС+MapCameraListener.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation

extension MakeReportMapViewController: YMKMapCameraListener {
    func onCameraPositionChanged(with map: YMKMap,
                                 cameraPosition: YMKCameraPosition,
                                 cameraUpdateSource: YMKCameraUpdateSource,
                                 finished: Bool) {
        if finished { 
            let geocoder = CLGeocoder()
            let center = convertPointToLocation(from: userLocation) // From user location
            
            guard let previousLocation = self.previousLocation else { return }
            guard center.distance(from: previousLocation) > 10 else { return }
            self.previousLocation = center
            
            
            geocoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
                guard let self = self else { return }
                
                if let errorToHandle = error {
//                    TODO:  Show alert informing the user
                    print(errorToHandle.localizedDescription)
                    return
                }
                
                guard let placemark =  placemarks?.first else {
//                    TODO:  Show alert informing the user
                    return
                }
                
                let house = placemark.subThoroughfare ?? ""
                let street = placemark.thoroughfare ?? ""
                let city = placemark.locality ?? ""
                let district = placemark.administrativeArea ?? ""
                let country = placemark.country ?? ""
                
                DispatchQueue.main.async {
                    self.cityAddress.text = "\(city), \(district), \(country)"
                    self.streetAddress.text = "\(street), \(house)"
                }
            }
        }
    }
    
    
}
