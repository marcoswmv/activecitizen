//
//  ImageSliderViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 22.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit


class ImageSliderViewController: BaseCollectionViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var paginationLabel: UILabel!
    
    
    @IBAction func popImageSliderViewControllerOnTouchUpInside(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    var dataSource: ImageSliderDataSource?
    var photos: [Photo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let photos = photos {
            dataSource = ImageSliderDataSource(collectionView: self.imagesCollectionView)
            dataSource?.addPhotos(with: photos)
        } else {
            print("No photos")
        }
    }
}
