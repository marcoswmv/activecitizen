//
//  UIView+DashedBorder.swift
//  ActiveCitizen
//
//  Created by Marcos Vicente on 06.12.2019.
//  Copyright © 2019 Antares Software. All rights reserved.
//

import UIKit

extension UIView {
  func addDashedBorder() {
    let color = UIColor.lightText.cgColor

    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let frameSize = self.frame.size
    let shapeRect = CGRect(x: 0, y: 0, width: 363, height: 0.5)

    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = color
    shapeLayer.lineWidth = 0.5
    shapeLayer.lineJoin = CAShapeLayerLineJoin.round
    shapeLayer.lineDashPattern = [1,1]
    shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath

    self.layer.addSublayer(shapeLayer)
    }
}
