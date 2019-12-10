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
    @IBOutlet weak var addAddress: UIButton!
    @IBOutlet weak var chooseCategory: UIButton!
    @IBOutlet weak var addPhoto: UIButton!
    @IBOutlet weak var makeReport: UIButton!
    @IBOutlet weak var scrollViewContentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var maxLength: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.mapWindow.map.move(with: YMKCameraPosition.init(target: YMKPoint(latitude: 55.751574, longitude: 37.573856), zoom: 15, azimuth: 0, tilt: 0),
                                   animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 0.5),
                                   cameraCallback: nil)
        mapView.mapWindow.map.logo.setAlignmentWith(YMKLogoAlignment(horizontalAlignment: YMKLogoHorizontalAlignment.left,
                                                                     verticalAlignment: YMKLogoVerticalAlignment.bottom))

        dashedSeparator.addDashedBorder()
        
        self.hideKeyboardWhenTappedAround()
        
        if makeReport.isTouchInside {
            makeReport.isHighlighted = true
        } else if addAddress.isTouchInside {
            addAddress.isHighlighted = true
        } else if chooseCategory.isTouchInside {
            chooseCategory.isHighlighted = true
        } else if addPhoto.isTouchInside {
            addPhoto.isHighlighted = true
        }
        
        maxLength.text = "0 / 1000"
        reportDescription.text = "Текст сообщения"
        reportDescription.textColor = .lightGray
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let height = self.contentScrollView?.frame.size.height {
            print(height)
            self.scrollViewContentHeightConstraint.constant = height
            self.view.layoutSubviews()
        }
    }
    
    @IBAction func myPositionOnTouchUpInside(_ sender: Any) {
        print("Showing user's position on map")
    }
    
    @IBAction func addAddressOnTouchUpInside(_ sender: Any) {
        print("Adding address manually")
    }
    
    @IBAction func specifyAddressOnTouchUpInside(_ sender: Any) {
        print("Specifying address on map")
    }
    
    @IBAction func chooseCategoryOnTouchUpInside(_ sender: Any) {
        print("Changing category")
    }
    
    @IBAction func addPhotoOnTouchUpInside(_ sender: Any) {
        print("Adding photo to the report")
    }
    
    @IBAction func makeReportOnTouchUpInside(_ sender: Any) {
        print("Making report")

    }
    
}
