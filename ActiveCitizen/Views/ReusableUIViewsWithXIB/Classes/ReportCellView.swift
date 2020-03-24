//
//  ExampleUIViewWithXib.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

@IBDesignable
class ReportCellView: UIViewWithXib {

    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var numberOfPhotos: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var subCategoryName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var dateOfCreation: UILabel!
    
    var photos: [String]?
    
    @IBAction func showPhotosOnTouchUpInside(_ sender: UIButton) {
        
        let imageViewController = ImageViewController.instantiate() as! ImageViewController
        
        imageViewController.photosToReceive = photos
        
        self.findViewController()?.navigationController?.pushViewController(imageViewController, animated: true)
    }
}
