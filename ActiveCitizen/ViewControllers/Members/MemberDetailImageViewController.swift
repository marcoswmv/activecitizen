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
    
    
    var imagesManager = ImagesManager()
    var imagesToDisplay: [String]?
    
    
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
        
        if let imagesIDs = imagesToDisplay {
                    
            for imageId in imagesIDs {

                imagesManager.getImage(with: imageId) { (response, error) in

                    if error != nil {
//                        Show an alert to the user
                        
                        print("Error: ", error?.errorDescription as Any)
                    } else {
                        if let image = response?.image {
                            self.scrollView.auk.show(image: image)

                            let totalNumber = self.scrollView.auk.numberOfPages
                            self.pagination.text = "Фото 1 из \(totalNumber)"
                        }
                    }
                }
            }
        }
    }
    
    
    
//    MARK: - Scrollview delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if let currentPage = scrollView.auk.currentPageIndex {
            let totalNumber = scrollView.auk.numberOfPages
            pagination.text = "Фото \(currentPage + 1) из \(totalNumber)"
        }
    }
}
