//
//  PhotoCollectionDataSource+PhotoCollectionCellDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 22.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension PhotoCollectionDataSource: PhotoCollectionCellDelegate {
    
    func deletePhoto(at cell: PhotoCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            data.remove(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
        }
        collectionView.isHidden = data.isEmpty ? true : false
    }
}
