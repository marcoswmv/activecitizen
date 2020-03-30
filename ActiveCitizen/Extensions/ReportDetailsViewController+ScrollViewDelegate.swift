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
        
        var images = [UIImage?]()
        
        if let photosNames = report?.photos {
            
            for photoName in photosNames {
                images.append(UIImage(named: photoName))
            }
        }
        
        if images.isEmpty {
            
            print("No images")
            
        } else {
            
            for image in images {
                
                if let image = image {
                    reportDetailsView?.scrollView.auk.show(image: image)
                }
            }
        }
        
    }
}
