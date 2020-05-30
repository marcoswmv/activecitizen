//
//  ExampleUIViewWithXib.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 03.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

class ReportView: UIViewWithXib {

    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var numberOfPhotos: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var subCategoryName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var dateOfCreation: UILabel!
    
    var images: [String]?
    
    @IBAction func showPhotosOnTouchUpInside(_ sender: UIButton) {
        if self.tag == 0 {
            let imageViewController = ImageSliderViewController.instantiate() as! ImageSliderViewController
            
            imageViewController.imagesToDisplay = images
            
            self.findViewController()?.navigationController?.pushViewController(imageViewController, animated: true)
        } else if self.tag == 1 {
            let memberDetailImageViewController = MemberDetailImageViewController.instantiate() as! MemberDetailImageViewController
            
            memberDetailImageViewController.imagesToDisplay = images
            
            self.findViewController()?.navigationController?.pushViewController(memberDetailImageViewController, animated: true)
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        setupUIElements()
    }
    
    func setupUIElements() {
        categoryIcon.isHidden = true
        subCategoryName.isHidden = true
    }
}
