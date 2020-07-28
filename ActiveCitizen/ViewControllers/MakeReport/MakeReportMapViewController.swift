//
//  MakeReportMapViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 02.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit
import CoreLocation

protocol PhotoCollectionControllerDelegate {
    func addPhoto(with image: UIImage)
}

class MakeReportMapViewController: BaseMakeReportViewController {

//    MARK: - OUTLETS
    
    @IBOutlet weak var mapView: YMKMapView!
    @IBOutlet weak var dashedSeparator: UIView!
    @IBOutlet weak var reportDescription: UITextView!
    @IBOutlet weak var scrollViewContentHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var maxLength: UILabel!
    
    @IBOutlet weak var cityAddress: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var noCategory: UILabel!
    @IBOutlet weak var noMessage: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func showMyPositionOnTouchUpInside(_ sender: Any) {
        setCenterMapForLocation(userLocation)
    }
    
    @IBAction func showAddressOnMapOnTouchUpInside(_ sender: Any) {
        let showAddressOnMapViewController = ShowAddressOnMapViewController.instantiate()  as! ShowAddressOnMapViewController
        
        showAddressOnMapViewController.completionHandler = { street, city, location in
            self.streetAddress.text = street
            self.cityAddress.text = city
            
            let latitude = location.coordinate.latitude.description
            let longitude = location.coordinate.longitude.description
            self.reportCoordinates = "\(latitude),\(longitude)"
        }
        navigationController?.pushViewController(showAddressOnMapViewController, animated: true)
    }
    
    @IBAction func addPhotoOnTouchUpInside(_ sender: Any) {
        choosePhotoSourceAlertController()
    }
    
    @IBAction func makeReportOnTouchUpInside(_ sender: Any) {
        checkEmptyFields()
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
        
        chooseCategoryViewController.completionHandler = { icon, subCategory, categoryId, subCategoryId in
            self.categoryIcon.isHidden = false
            self.categoryIcon.image = icon
            self.category.text = subCategory
            self.categoryId = categoryId
            self.subCategoryId = subCategoryId
        }
        noCategory.isHidden = true
        navigationController?.pushViewController(chooseCategoryViewController, animated: true)
    }

    
//    MARK: - PROPERTIES
    
    lazy var map: YMKMap = { return self.mapView.mapWindow.map }()
    lazy var mapWindow: YMKMapWindow = { return self.mapView.mapWindow }()
    
    let locationManager: CLLocationManager = CLLocationManager()
    var userLocation: YMKPoint = YMKPoint()
    var previousLocation: CLLocation?
    var zoom: Float = 17.0
    let VOLGOGRAD_COORDINATES: YMKPoint = YMKPoint(latitude: 48.7193900, longitude: 44.5018300)
    
    
    let addressesManager: AddressesManager = AddressesManager()
    var locationFromPin: CLLocation?
    
    var photoCollectionDataSource: PhotoCollectionDataSource!
    var photoCollectionControllerDelegate: PhotoCollectionControllerDelegate?
    
    let makeReportManager: MakeReportManager = MakeReportManager()
    let imagesManager: ImagesManager = ImagesManager()
    var reportCoordinates: String?
    var categoryId: Int?
    var subCategoryId: Int?
    
    
//    MARK: - METHODS
    
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
        setupNavigationBarTitle(with: "Сообщить")
        setupNavigationBarShadow(activate: true)
        
        self.hideKeyboardWhenTappedAround()
        maxLength.text = "0 / 500"
        reportDescription.text = "Текст сообщения"
        reportDescription.textColor = .lightGray
        categoryIcon.isHidden = true
        
        photoCollectionDataSource = PhotoCollectionDataSource(collectionView: self.collectionView)
    }
    
    func setupScrollViewContent() {
        if let height = self.contentScrollView?.frame.size.height {
            self.scrollViewContentHeightConstraint.constant = height
            self.view.layoutSubviews()
        }
    }
    
    func uploadImagesToServer() {
        var imagesDictionary: [String: Any] = [String: Any]()
        let photos = photoCollectionDataSource.data
        
//        TO-DO: An error is occurring due to the user being uploaded as an UIImage. Should be a image file type such as: .jpg or .png
//        as a quick solution, I'm just uploading a fictional name
        
//        _ = photos.map({ imagesDictionary.updateValue($0.image as Any, forKey: "files") })
        _ = photos.map({ _ in imagesDictionary.updateValue(UUID().uuidString, forKey: "description") })
        
        imagesManager.uploadImages(dictionary: imagesDictionary) { (result, error) in
           if error != nil {
               Alert.showAlert(on: self, style: .alert, title: "Ошибка", message: "Приносим свои извинения!\nНа данный момент сервер недоступен поэтому сообщить о проблеме невозможно!")
           } else {
               Alert.showAlert(on: self, style: .alert, title: "Успешно", message: result!)
           }
        }
    }
    
    func composeMessage() {
        
        uploadImagesToServer()
        
        guard let reportCoordinates = reportCoordinates else { return }
        
        var message: [String: Any] = [String: Any]()
        
        let userId = 0 // see what's the correct format
        let categoryId = self.categoryId
        let subCategoryId = self.subCategoryId
        let address = "\(cityAddress.text!), \(streetAddress.text!)"
        let coordinates = reportCoordinates
        let description = reportDescription.text
        let files = [String]() // see what's the correct format
        
        message.updateValue(userId, forKey: "userId")
        message.updateValue(categoryId!, forKey: "categoryId")
        message.updateValue(subCategoryId!, forKey: "subCategoryId")
        message.updateValue(address, forKey: "address")
        message.updateValue(coordinates , forKey: "coordinates")
        message.updateValue(description!, forKey: "description")
        message.updateValue(files, forKey: "files")
        
        
        makeReportManager.makeReport(dictionary: message) { (result, error) in
            if error != nil {
                Alert.showAlert(on: self, style: .alert, title: "Ошибка", message: "Приносим свои извинения!\nНа данный момент сервер недоступен поэтому сообщить о проблеме невозможно!")
            } else {
                Alert.showAlert(on: self, style: .alert, title: "Успешно", message: result!)
            }
        }
    }
    
    func checkEmptyFields() {
        if category.text == "Выбрать категорию" {
            noCategory.isHidden = false
        }
        
        if reportDescription.text == "Текст сообщения" {
            noMessage.isHidden = false
        }
        
        if category.text != "Выбрать категорию", reportDescription.text != "Текст сообщения" {
            noCategory.isHidden = true
            noMessage.isHidden = true
            composeMessage()
        }
    }
}
