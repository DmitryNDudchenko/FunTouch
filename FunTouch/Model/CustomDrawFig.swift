//
//  CustomDrawFig.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 20.07.2023.
//

import UIKit
@IBDesignable
class CustomDrawFig: UIView {

   @IBInspectable var startColor: UIColor = UIColor.red
   @IBInspectable var endColor: UIColor = UIColor.yellow
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], cornerRadii: CGSize(width: 35, height: 35))
        path.addClip()
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocation: [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: colors as CFArray,
            locations: colorLocation
        ) else {
            return
        }
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: self.bounds.height)
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }

}
