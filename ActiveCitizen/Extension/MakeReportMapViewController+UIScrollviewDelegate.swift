//
//  UIScroolView+Delegate.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 09.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension MakeReportMapViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offset: CGFloat = 225
        
        if scrollView.contentOffset.y > offset/2.0 && scrollView.contentOffset.y < offset {
            scrollView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        }
        
        if scrollView.contentOffset.y < offset/2.0 {
            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        
    }
    
}
