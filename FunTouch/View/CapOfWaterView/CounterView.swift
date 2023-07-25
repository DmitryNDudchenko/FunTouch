//
//  CounterView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 25.07.2023.
//

import UIKit

@IBDesignable
class CounterView: UIView {
    
    private enum Constants {
        static let numberOfGlass = 15
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 75
        
        static var halfOfLineWigth:CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 10 {
        didSet {
            if counter <= Constants.numberOfGlass {
                setNeedsDisplay()
            }
        }
    }
    
   @IBInspectable var outLineColor: UIColor = UIColor.black
   @IBInspectable var counterColor: UIColor = UIColor.green
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = max(bounds.width, bounds.height)
        let startAngel: CGFloat = 3 * .pi / 4
        let endAngel: CGFloat = .pi / 4
        
        
        let path = UIBezierPath(
            arcCenter: center,
            radius: radius / 2 - Constants.arcWidth / 2,
            startAngle: startAngel,
            endAngle: endAngel,
            clockwise: true
        )
        
        path.lineWidth = Constants.lineWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifferance: CGFloat = 2 * .pi - startAngel + endAngel
        let arcLengthRadius: CGFloat = angleDifferance / CGFloat(Constants.numberOfGlass)
        let outlineEndAngle = arcLengthRadius * CGFloat(counter) + startAngel
        let outerArcRadius = bounds.width / 2 - Constants.halfOfLineWigth
        
        let outLinePath = UIBezierPath(
            arcCenter: center,
            radius: outerArcRadius,
            startAngle: startAngel,
            endAngle: outlineEndAngle,
            clockwise: true
        )
        
        let innerArcRadius = bounds.width / 2 - Constants.arcWidth + Constants.halfOfLineWigth
        
        outLinePath.addArc(
            withCenter: center,
            radius: innerArcRadius,
            startAngle: outlineEndAngle,
            endAngle: startAngel,
            clockwise: false
        )
        
        outLinePath.close()
        outLineColor.setStroke()
        outLinePath.lineWidth = Constants.lineWidth
        outLinePath.stroke()
        
        context.saveGState()
        
        outLineColor.setFill()
        
        let markerWidth: CGFloat = 5.0
        let markerSize: CGFloat = 10.0
        
        let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth / 2, y: 0, width: markerWidth, height: markerSize))
        
        context.translateBy(x: rect.width / 2, y: rect.height / 2)
        
        for mark in 1...Constants.numberOfGlass {
            context.saveGState()
            let angle = arcLengthRadius * CGFloat(mark) + startAngel - .pi / 2
            context.rotate(by: angle)
            context.translateBy(x: 0, y: rect.height / 2 - markerSize)
            
            markerPath.fill()
            context.restoreGState()
        }
        context.restoreGState()
    }
    
    
}
