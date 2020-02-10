//
//  MakeReportMapViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit

class MakeReportMapViewController: BaseMakeReportViewController, AddressDelegate {

    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var dashedSeparator: UIView!
    @IBOutlet weak var reportDescription: UITextView!
    @IBOutlet weak var scrollViewContentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var maxLength: UILabel!
    
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    
    
    let specifyAddressViewController = SpecifyAddressViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapWindow.map.move(with: YMKCameraPosition.init(target: YMKPoint(latitude: 55.751574, longitude: 37.573856), zoom: 15, azimuth: 0, tilt: 0),
                                   animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 0.5),
                                   cameraCallback: nil)
        mapView.mapWindow.map.logo.setAlignmentWith(YMKLogoAlignment(horizontalAlignment: YMKLogoHorizontalAlignment.left,
                                                                     verticalAlignment: YMKLogoVerticalAlignment.bottom))

        dashedSeparator.addDashedBorder()
        
        self.hideKeyboardWhenTappedAround()
        
        maxLength.text = "0 / 1000"
        reportDescription.text = "Текст сообщения"
        reportDescription.textColor = .lightGray
        specifyAddressViewController.selectAddressDelegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let height = self.contentScrollView?.frame.size.height {
            self.scrollViewContentHeightConstraint.constant = height
            self.view.layoutSubviews()
        }
    }
    
    @IBAction func myPositionOnTouchUpInside(_ sender: Any) {
        print("Showing user's position on map")
    }
    
    @IBAction func makeReportOnTouchUpInside(_ sender: Any) {
        print("Making report")

    }
    
    func setAddress(with street: String, and city: String) {
        print("City: ", city, "and street: ", street)
        self.cityAddress.text = city
        self.streetAddress.text = street
    }
}
