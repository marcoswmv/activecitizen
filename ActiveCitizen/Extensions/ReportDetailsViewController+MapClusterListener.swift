//
//  ReportDetailsViewController+MapClusterListener.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 27.03.2020.
//  Copyright © 2020 Antares Software. All rights reserved.
//

import UIKit
import YandexMapKit

extension ReportDetailsViewController: YMKClusterListener, YMKClusterTapListener {
    
    func generatePoints(_ data: [Report]) -> [YMKPoint] {
        
        var points = [YMKPoint]()
        for report in data {
            
            if (report.latitude != nil) && (report.longitude != nil) {
                points.append(YMKPoint(latitude: report.latitude!, longitude: report.longitude!))
            }
        }
        return points
    }
    
    func onClusterAdded(with cluster: YMKCluster) {
        // We setup cluster appearance and tap handler in this method
        cluster.appearance.setIconWith(UIImage.clusterImage(cluster.size))
        cluster.addClusterTapListener(with: self)
    }

    func onClusterTap(with cluster: YMKCluster) -> Bool {
        
        let alert = UIAlertController(
            title: "Tap",
            message: String(format: "Tapped cluster with %u items", cluster.size),
            preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)

        // We return true to notify map that the tap was handled and shouldn't be
        // propagated further.
        return true
    }
}
