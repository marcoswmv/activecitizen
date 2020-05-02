//
//  UIImage+MapMarkers.swift
//  ActiveCitizen
//
//  Created by Dmitry Byankin on 04.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit


extension UIImage {
    
    class func clusterImage(_ clusterSize: UInt) -> UIImage {
    
        // https://github.com/yandex/mapkit-ios-demo
        
        let FONT_SIZE: CGFloat = 15
        let MARGIN_SIZE: CGFloat = 3
        let STROKE_SIZE: CGFloat = 3
        
        let scale = UIScreen.main.scale
        let text = (clusterSize as NSNumber).stringValue
        let font = UIFont.systemFont(ofSize: FONT_SIZE * scale)
        let size = text.size(withAttributes: [NSAttributedString.Key.font: font])
        let textRadius = sqrt(size.height * size.height + size.width * size.width) / 2
        let internalRadius = textRadius + MARGIN_SIZE * scale
        let externalRadius = internalRadius + STROKE_SIZE * scale
        let iconSize = CGSize(width: externalRadius * 2, height: externalRadius * 2)

        UIGraphicsBeginImageContext(iconSize)
        let ctx = UIGraphicsGetCurrentContext()!

        ctx.setFillColor(UIColor.white.cgColor)
        ctx.fillEllipse(in: CGRect(
            origin: .zero,
            size: CGSize(width: 2 * externalRadius, height: 2 * externalRadius)));

        ctx.setFillColor(UIColor(named: "App Green")!.cgColor)
        ctx.fillEllipse(in: CGRect(
            origin: CGPoint(x: externalRadius - internalRadius, y: externalRadius - internalRadius),
            size: CGSize(width: 2 * internalRadius, height: 2 * internalRadius)));

        (text as NSString).draw(
            in: CGRect(
                origin: CGPoint(x: externalRadius - size.width / 2, y: externalRadius - size.height / 2),
                size: size),
            withAttributes: [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: UIColor.white])
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    // TODO: category
    class func markerImage() -> UIImage {
        
        return UIImage(named: "map_pin_green")!
    }
    
    func setIcon(id: Int) -> UIImage {
        switch id {
        case 1101:
            return UIImage.yardArea!
        case 1102:
            return UIImage.road!
        case 1103:
            return UIImage.water!
        case 1104:
            return UIImage.fire!
        case 1105:
            return UIImage.buildings!
        case 1106:
            return UIImage.publicTransport!
        case 1107:
            return UIImage.payments!
        case 1108:
            return UIImage.empty
        default:
            return UIImage()
        }
    }
}
