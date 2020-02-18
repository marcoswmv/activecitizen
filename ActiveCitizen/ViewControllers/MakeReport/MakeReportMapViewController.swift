//
//  MakeReportMapViewController.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit


class MakeReportMapViewController: BaseMakeReportViewController {

    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var dashedSeparator: UIView!
    @IBOutlet weak var reportDescription: UITextView!
    @IBOutlet weak var scrollViewContentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var maxLength: UILabel!
    
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    
    let TARGET_LOCATION = YMKPoint(latitude: 55.751574, longitude: 37.573856)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapWindow.map.move(with: YMKCameraPosition.init(target: TARGET_LOCATION, zoom: 15, azimuth: 0, tilt: 0),
                                   animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 1),
                                   cameraCallback: nil)
        mapView.mapWindow.map.logo.setAlignmentWith(YMKLogoAlignment(horizontalAlignment: YMKLogoHorizontalAlignment.left,
                                                                     verticalAlignment: YMKLogoVerticalAlignment.bottom))

        dashedSeparator.addDashedBorder()
        
        self.hideKeyboardWhenTappedAround()
        
        maxLength.text = "0 / 1000"
        reportDescription.text = "Текст сообщения"
        reportDescription.textColor = .lightGray
        setupNavigationBarShadow()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let height = self.contentScrollView?.frame.size.height {
            self.scrollViewContentHeightConstraint.constant = height
            self.view.layoutSubviews()
        }
    }
    
    @IBAction func enterAddressOnTouchUpInside(_ sender: Any) {
        let makeReportStoryboard = UIStoryboard(name: "MakeReport", bundle: nil)
        let enterAddressViewController = makeReportStoryboard.instantiateViewController(withIdentifier: "EnterAddressViewController") as! EnterAddressViewController
        
        enterAddressViewController.completionHandler = { street, city in
            self.streetAddress.text = street
            self.cityAddress.text = city
        }
        
        navigationController?.pushViewController(enterAddressViewController, animated: true)
    }
    
    @IBAction func myPositionOnTouchUpInside(_ sender: Any) {
        print("Showing user's position on map")
    }
    
    @IBAction func makeReportOnTouchUpInside(_ sender: Any) {
        print("Making report")

    }
}
