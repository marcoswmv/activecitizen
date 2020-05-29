//
//  PhotoCollectionDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class PhotoCollectionDataSource: BaseCollectionViewDataSource {
    
    var data: [Photo] = [Photo]()
    var completionHandler: ((_ :[Photo]) -> Void)?
    
    override func setup() {
        super.setup()
        
        if let makeReportMapViewController = UIApplication.topViewController() as? MakeReportMapViewController {
            makeReportMapViewController.photoCollectionControllerDelegate = self
        }
    }
    
//    MARK: - DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.data = data[indexPath.item]
        cell.delegate = self
        
        return cell
    }
    
    
//    MARK: - Collection Delegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let imageSliderViewController = ImageSliderViewController.instantiate() as! ImageSliderViewController
        imageSliderViewController.photos = data
        UIApplication.topViewController()?.navigationController?.pushViewController(imageSliderViewController, animated: true)
    }
}
