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
    
    var completionHandler: ((_ currentIndex: Int) -> Void)?
    
    override func setup() {
        super.setup()
        
    }
    
    func addPhotos(with images: [Photo]) {
        data = images
        collectionView.reloadData()
    }
    
//    MARK: - DATA SOURCE
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSliderViewCell.identifier, for: indexPath) as! ImageSliderViewCell
        
        cell.data = data![indexPath.item]
        return cell
    }
    
//    MARK: - COLLECTION VIEW'S SCROLL VIEW DELEGATE
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing

        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)

        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let center = CGPoint(x: scrollView.contentOffset.x + scrollView.frame.width, y: scrollView.frame.height)
        guard let indexPath = collectionView.indexPathForItem(at: center) else { return }
        completionHandler!(indexPath.row + 1)
    }
}
