//
//  ShowAddressOnMapViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 08.02.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import YandexMapKitSearch
import CoreLocation

class ShowAddressOnMapViewController: BaseShowAddressOnMapViewController {

    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var warningLabel: UILabel!
    
    @IBAction func doneOnTouchUpInside(_ sender: Any) {
        completionHandler!(streetAddress.text!, cityAddress.text!, previousLocation!)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showMyPositionOnTouchUpInside(_ sender: Any) {
        setCenterMapForLocation(userLocation)
    }
    
    lazy var map: YMKMap = { return self.mapView.mapWindow.map }()
    lazy var mapWindow: YMKMapWindow = { return self.mapView.mapWindow }()
    
    let locationManager = CLLocationManager()
    var userLocation = YMKPoint()
    var previousLocation: CLLocation?
    var zoom: Float = 17.0

    var completionHandler: ((String, String, CLLocation) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        checkLocationServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        makeNavigationBarInvisible()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        makeNavigationBarVisible()
    }
    
    
}
