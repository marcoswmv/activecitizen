//
//  PhotoCollectionViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 21.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

protocol PhotoCollectionCellDelegate {
    func deletePhoto(at cell: PhotoCollectionViewCell)
}

class PhotoCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var delegate: PhotoCollectionCellDelegate?
    
    var data: Photo? {
        didSet {
            imageView.image = data?.image
        }
    }
    
    @IBAction func deletePhotoOnTouchUpInside(_ sender: Any) {
        delegate?.deletePhoto(at: self)
    }
    
}
