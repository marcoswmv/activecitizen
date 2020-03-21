//
//  MakeReportMapViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation

class MakeReportMapViewController: BaseMakeReportViewController {

    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var dashedSeparator: UIView!
    @IBOutlet weak var reportDescription: UITextView!
    @IBOutlet weak var scrollViewContentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var maxLength: UILabel!
    
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var scrollView: MakeReportScrollView!
    
    @IBAction func showMyPositionOnTouchUpInside(_ sender: Any) {
        setCenterMapForLocation(userLocation)
    }
    
    @IBAction func showAddressOnMapOnTouchUpInside(_ sender: Any) {
        let showAddressOnMapViewController = ShowAddressOnMapViewController.instantiate()  as! ShowAddressOnMapViewController
        
        showAddressOnMapViewController.completionHandler = { street, city, location in
            self.streetAddress.text = street
            self.cityAddress.text = city
        }
        navigationController?.pushViewController(showAddressOnMapViewController, animated: true)
    }
    
    @IBAction func addPhotoOnTouchUpInside(_ sender: Any) {
//        TODO: Upload photo to server
        choosePhotoSourceAlertController()
    }
    
    @IBAction func makeReportOnTouchUpInside(_ sender: Any) {
        print("Making report")
//        TODO: Connect to server to make the report
    }
    
    @IBAction func enterAddressOnTouchUpInside(_ sender: Any) {
        let enterAddressViewController = EnterAddressViewController.instantiate() as! EnterAddressViewController
        
        enterAddressViewController.location = self.locationFromPin
        enterAddressViewController.cityAddress = self.cityAddress.text
        enterAddressViewController.streetAddress = self.streetAddress.text
        
        enterAddressViewController.completionHandler = { street, city in
            self.streetAddress.text = street
            self.cityAddress.text = city
        }
        navigationController?.pushViewController(enterAddressViewController, animated: true)
    }
    
    @IBAction func chooseCategoryOnTouchUpInside(_ sender: Any) {
        let chooseCategoryViewController = CategoriesViewController.instantiate() as! CategoriesViewController
        
        chooseCategoryViewController.completionHandler = { icon, chosenCategory in
            self.categoryIcon.isHidden = false
            self.categoryIcon.image = icon
            self.category.text = chosenCategory
        }
        navigationController?.pushViewController(chooseCategoryViewController, animated: true)
    }
    
    
    lazy var map: YMKMap = { return self.mapView.mapWindow.map }()
    lazy var mapWindow: YMKMapWindow = { return self.mapView.mapWindow }()
    
    let locationManager = CLLocationManager()
    var userLocation = YMKPoint()
    var previousLocation: CLLocation?
    var zoom: Float = 17.0
    
    let addressesManager = AddressesManager()
    var locationFromPin: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        checkLocationServices()
        setupUIElementsInContentView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupScrollViewContent()
    }
    
    func setupUIElementsInContentView() {
        dashedSeparator.addDashedBorder()
        self.hideKeyboardWhenTappedAround()
        maxLength.text = "0 / 1000"
        reportDescription.text = "Текст сообщения"
        reportDescription.textColor = .lightGray
        categoryIcon.isHidden = true
    }
    
    func setupScrollViewContent() {
        if let height = self.contentScrollView?.frame.size.height {
            self.scrollViewContentHeightConstraint.constant = height
            self.view.layoutSubviews()
        }
    }
}
