//
//  PhotoCollectionDataSource+PhotoCollectionControllerDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 22.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension PhotoCollectionDataSource: PhotoCollectionControllerDelegate {
    
    func addPhoto(with image: UIImage,
                  at viewController: MakeReportMapViewController) {
        
        data.append(Photo(image: image))
        collectionView.reloadData()
        collectionView.isHidden = data.isEmpty ? true : false
    }
}
