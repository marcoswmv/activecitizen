//
//  ImageSliderViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 22.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit


class ImageSliderViewController: BaseCollectionViewController {

//    MARK: - OUTLETS
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var paginationLabel: UILabel!
    
    @IBAction func popImageSliderViewControllerOnTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    MARK: - PROPERTIES
    var dataSource: ImageSliderDataSource?
    var photos: [Photo]?
    
//    MARK: - METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photos = photos {
            paginationLabel.text = "Фото 1 из \(photos.count)"
            
            dataSource = ImageSliderDataSource(collectionView: self.imagesCollectionView)
            dataSource?.addPhotos(with: photos)
            dataSource?.completionHandler = { currentIndex in
                self.paginationLabel.text = "Фото \(currentIndex) из \(photos.count)"
            }
        } else {
            Alert.showAlert(on: self, style: .alert, title: "No photos", message: nil)
        }
    }
}
