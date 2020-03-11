//
//  MakeReportMapVС+LocationManagerDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 26.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation

extension MakeReportMapViewController: CLLocationManagerDelegate {

//    MARK: View Controller Setup
    
    func setupMap() {
            map.isRotateGesturesEnabled = false
            map.addCameraListener(with: self)
            map.move(with: YMKCameraPosition.init(target: userLocation, zoom: zoom, azimuth: 0, tilt: 0))
            map.logo.setAlignmentWith(YMKLogoAlignment(horizontalAlignment: YMKLogoHorizontalAlignment.left,
                                                       verticalAlignment: YMKLogoVerticalAlignment.bottom))
            showUserLocationOnMap()
        }
        
        func setCenterMapForLocation(_ location: YMKPoint?) {
            guard let location = location else { return }
            map.move(with: YMKCameraPosition.init(target: location, zoom: zoom, azimuth: 0, tilt: 0),
                     animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 0.5),
                     cameraCallback: nil)
        }
        
        func showUserLocationOnMap() {
            let mapKit = YMKMapKit.sharedInstance()
            let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)

            userLocationLayer.setVisibleWithOn(true)
            userLocationLayer.isHeadingEnabled = true
            userLocationLayer.setObjectListenerWith(self)
        }
    
//    MARK: Location Manager Setup
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            checkLocationAuthorization()
        } else {
///            Show alert letting user know they have to turn this on
        }
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            startTrackingUserLocation()
        case .authorizedAlways:
            break
        case .denied:
///            Show alert instruting them how to turn on permissions
            break
        case .restricted:
///            Show alert letting them know they can't change user's permissions
            break
        @unknown default:
            fatalError("Unknown authorization status case occurred!")
        }
    }
    
    func startTrackingUserLocation() {
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: map)
    }
    
    func centerViewOnUserLocation() {
        guard let location = locationManager.location?.coordinate else { return }
        let userLocation = YMKPoint(latitude: location.latitude, longitude: location.longitude)
        map.move(with: YMKCameraPosition.init(target: userLocation, zoom: zoom, azimuth: 0, tilt: 0),
                 animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 0.5),
                 cameraCallback: nil)
    }
    
    func getCenterLocation(for map: YMKMap) -> CLLocation {
        let latitude = map.cameraPosition.target.latitude
        let longitude = map.cameraPosition.target.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func convertPointToLocation(from coordinates: YMKPoint) -> CLLocation {
        let latitude = coordinates.latitude
        let longitude = coordinates.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    
//    MARK: Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = YMKPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
