//
//  ImageSliderDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 22.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class ImageSliderDataSource: BaseCollectionViewDataSource {
    
    private let manager = ImagesManager()
    private(set) var data: [Photo]?
    
    override func setup() {
        super.setup()
        
    }
    
    func addPhotos(with images: [Photo]) {
        data = images
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderViewCell.identifier, for: indexPath) as! ImageSliderViewCell
        
        cell.data = data![indexPath.item]
        return cell
    }
    
}
