//
//  ImageViewController.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 24.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import Auk

class MemberDetailImageViewController: BaseMemberDetailImageViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pagination: UILabel!
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let currentPage = scrollView.auk.currentPageIndex {
            let totalNumber = scrollView.auk.numberOfPages
            pagination.text = "Фото \(currentPage + 1) из \(totalNumber)"
        }
    }
    
    var photosToReceive: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImageViewer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        makeNavigationBarInvisible()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        makeNavigationBarVisible()
    }
    
    func setupImageViewer() {
        
        scrollView.auk.settings.pageControl.backgroundColor = .clear
        scrollView.auk.settings.pageControl.pageIndicatorTintColor = .clear
        scrollView.auk.settings.pageControl.currentPageIndicatorTintColor = .clear
        
        var images = [UIImage?]()
        
        if let photosNames = photosToReceive {
            
            for photoName in photosNames {
                images.append(UIImage(named: photoName))
            }
        }
        
        if images.isEmpty {
            
            pagination.text = "Фото 0 из 0"
            
        } else {
            
            for image in images {
                
                if let image = image {
                    scrollView.auk.show(image: image)
                }
            }
            
            let totalNumber = scrollView.auk.numberOfPages
            pagination.text = "Фото 1 из \(totalNumber)"
        }
        
    }
}
