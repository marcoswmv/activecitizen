//
//  ReportDetailsViewController+ScrollViewDelegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 27.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit

extension ReportDetailsViewController: UIScrollViewDelegate {
    
    func setupImageViewer() {
        
        reportDetailsView?.scrollView.auk.settings.pageControl.backgroundColor = .clear
        reportDetailsView?.scrollView.auk.settings.pageControl.pageIndicatorTintColor = .clear
        reportDetailsView?.scrollView.auk.settings.pageControl.currentPageIndicatorTintColor = .clear
        
        guard let imagesIDs = report?.imagesIDs else { return }

        for imageId in imagesIDs {
            imagesManager.getImage(with: imageId) { (response, error) in

                if error != nil {
//                    Alert.showAlert(on: self, style: .alert, title: "No images", message: "The server is not available to get images from")
                    
//                    ERROR getting images from server so getting dummy data
                    let image = UIImage(named: imageId)
                    self.reportDetailsView?.scrollView.auk.show(image: image!)
                } else if response != nil {
                    
                    if let image = response?.image {
                        self.reportDetailsView?.scrollView.auk.show(image: image)
                    }
                }
            }
        }
        
    }
}
