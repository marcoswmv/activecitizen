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
        
        if let imagesIDs = report?.imagesIDs {
            
            for imageId in imagesIDs {

                imagesManager.getImage(with: imageId) { (response, error) in

                    if error != nil {
//                        Show an alert to the user
                        print("Error: ", error?.errorDescription as Any)
                        
                    } else if response != nil {
                        
                        if let image = response?.image {
                            self.reportDetailsView?.scrollView.auk.show(image: image)
                        }
                    }
                }
            }
        }
    }
}
