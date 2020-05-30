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
    var imagesToDisplay: [String]?
    
//    MARK: - METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
    }
    
    func setupDataSource() {
        dataSource = ImageSliderDataSource(collectionView: self.imagesCollectionView)
        if let photos = photos {
            paginationLabel.text = "Фото 1 из \(photos.count)"
            dataSource?.addPhotos(with: photos)
        }
        if let imagesToDisplay = imagesToDisplay {
            paginationLabel.text = !imagesToDisplay.isEmpty ? "Фото 1 из \(imagesToDisplay.count)" : "Фото 0 из 0"
            dataSource?.imagesToDisplay = imagesToDisplay
            dataSource?.reload()
        }
        dataSource?.completionHandler = { currentIndex, total in
            self.paginationLabel.text = "Фото \(currentIndex) из \(total)"
        }
    }
}
