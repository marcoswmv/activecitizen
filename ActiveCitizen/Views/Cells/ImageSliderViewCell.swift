//
//  ImageSliderViewCell.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 23.05.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

class ImageSliderViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var data: Photo? {
        didSet {
            imageView.image = data?.image
        }
    }
}
