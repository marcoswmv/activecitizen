//
//  ReportDetailsVC+ReportLocationObjectListener.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 04.04.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit

extension ReportDetailsViewController: YMKUserLocationObjectListener {
    
//    TODO: MAp pin not showing on map
    
    func setupMapView() {
        
        let reportLocation = YMKPoint(latitude: (report?.latitude)!, longitude: (report?.longitude)!)
        
        map.isRotateGesturesEnabled = false
        map.move(with: YMKCameraPosition(target: reportLocation, zoom: zoom, azimuth: 0, tilt: 0))
        map.logo.setAlignmentWith(YMKLogoAlignment(horizontalAlignment: YMKLogoHorizontalAlignment.left,
                                                   verticalAlignment: YMKLogoVerticalAlignment.bottom))

        showReportLocationOnMap()
    }
    
    func showReportLocationOnMap() {
        let mapKit = YMKMapKit.sharedInstance()
        let reportLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)

        reportLocationLayer.setVisibleWithOn(true)
        reportLocationLayer.isHeadingEnabled = true
        reportLocationLayer.setObjectListenerWith(self)
    }
    
    func onObjectAdded(with view: YMKUserLocationView) {
        view.arrow.setIconWith(UIImage.mapPinGreen!)
        
        let pinPlacemark = view.pin.useCompositeIcon()
        pinPlacemark.setIconWithName("map_pin_green",
                                     image: UIImage.mapPinGreen!,
                                     style: YMKIconStyle(anchor: CGPoint(x: 0.5, y: 0.8) as NSValue,
                                                         rotationType:YMKRotationType.rotate.rawValue as NSNumber,
                                                         zIndex: 1,
                                                         flat: true,
                                                         visible: true,
                                                         scale: 1,
                                                         tappableArea: nil))
        
//        pinPlacemark.setIconWithName("category_icon",
//                                     image: (report?.categoryIcon)!,
//                                     style: YMKIconStyle(anchor: CGPoint(x: 0.5, y: 0.8) as NSValue,
//                                                         rotationType:YMKRotationType.rotate.rawValue as NSNumber,
//                                                         zIndex: 1,
//                                                         flat: true,
//                                                         visible: true,
//                                                         scale: 1,
//                                                         tappableArea: nil))
                
    }
    
    func onObjectRemoved(with view: YMKUserLocationView) {
    }
    
    func onObjectUpdated(with view: YMKUserLocationView, event: YMKObjectEvent) {
    }
    
    
}
