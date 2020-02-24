//
//  ShowAddressOnMapViewController+CoreLocation.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation

extension ShowAddressOnMapViewController: CLLocationManagerDelegate {
    
    func setupUsersLocationMarkerPin() {
        let scale = UIScreen.main.scale
        let mapKit = YMKMapKit.sharedInstance()!
        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
        
        userLocationLayer.setVisibleWithOn(true)
        userLocationLayer.isHeadingEnabled = true
        userLocationLayer.setAnchorWithAnchorNormal(
            CGPoint(x: 0.5 * mapView.frame.size.width * scale, y: 0.5 * mapView.frame.size.height * scale),
            anchorCourse: CGPoint(x: 0.5 * mapView.frame.size.width * scale, y: 0.83 * mapView.frame.size.height * scale))
        userLocationLayer.setObjectListenerWith(self)
    }
    
    
    
//    MARK: Location Manager Setup
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
///            Show alert letting user know they have to turn this on
        }
    }

    func setupLocationManager() {
        locationManager.delegate = self
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied:
///           SHow alert instruting them how to turn on permissions
            break
        case .restricted:
///            Show an alert letting them know they can't change user's permissions
            break
        @unknown default:
            fatalError("Unknown authorization status case occurred!")
        }
    }
    
    
//    MARK: Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        TARGET_LOCATION = YMKPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
