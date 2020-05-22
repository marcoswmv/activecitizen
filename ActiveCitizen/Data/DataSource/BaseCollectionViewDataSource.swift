//
//  PhotoCollectionViewDataSource.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class BaseCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private(set) var collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        
        super.init()
        setup()
    }
    
    func setup() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func reload() {
        fatalError("Not implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fatalError("Not implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Not implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
