//
//  ReportsMapViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation

class ReportsMapViewController: BaseReportsListViewController, YMKClusterListener, YMKClusterTapListener {
 
    @IBOutlet weak var mapView: YMKMapView!
    
    @IBAction func showUserLocationOnTouchUpInside(_ sender: Any) {
        
        setCenterMapForLocation(userLocation)
    }
    
    lazy var map: YMKMap = { return self.mapView.mapWindow.map }()
    lazy var mapWindow: YMKMapWindow = { return self.mapView.mapWindow }()
    
    let locationManager = CLLocationManager()
    var userLocation = YMKPoint()
    var zoom: Float = 15.0
    
    var initialZoom: Float = 6.0
    
    let manager = ReportsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapViewWithCluster()
        checkLocationServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    func setupMapViewWithCluster() {
        map.logo.setAlignmentWith(YMKLogoAlignment(horizontalAlignment: YMKLogoHorizontalAlignment.left,
                                                           verticalAlignment: YMKLogoVerticalAlignment.bottom))
                
                
        // Note that application must retain strong references to both
        // cluster listener and cluster tap listener
        let collection = mapView.mapWindow.map.mapObjects.addClusterizedPlacemarkCollection(with: self)
        
        // Load data
        displayLoading(loading: true)
        manager.getReportsList { (reports, error) in
            self.displayLoading(loading: false)
            
            if error != nil {
                print("error")
                return
            }
            
            let points = self.generatePoints(reports!)
            collection.clear()
            collection.addPlacemarks(with: points, image: UIImage.markerImage(), style: YMKIconStyle())
            
            collection.clusterPlacemarks(withClusterRadius: 60, minZoom: 15)
        }
    }
    
    func generatePoints(_ data: [Report]) -> [YMKPoint] {
        
        var points = [YMKPoint]()
        for report in data {
            
            if (report.latitude != nil) && (report.longitude != nil) {
                points.append(YMKPoint(latitude: report.latitude!, longitude: report.longitude!))
            }
        }
        return points
    }
    
    func onClusterAdded(with cluster: YMKCluster) {
        // We setup cluster appearance and tap handler in this method
        cluster.appearance.setIconWith(UIImage.clusterImage(cluster.size))
        cluster.addClusterTapListener(with: self)
    }

    func onClusterTap(with cluster: YMKCluster) -> Bool {
        
        let alert = UIAlertController(
            title: "Tap",
            message: String(format: "Tapped cluster with %u items", cluster.size),
            preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)

        // We return true to notify map that the tap was handled and shouldn't be
        // propagated further.
        return true
    }


}
