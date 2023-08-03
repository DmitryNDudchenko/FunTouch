//
//  GraphView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 25.07.2023.
//

import UIKit

@IBDesignable
class GraphView: UIView {

    struct Constants {
        static let cornerRadiusSize = CGSize(width: 8.0, height: 8.0)
        static let margin: CGFloat = 20.0
        static let topBorder: CGFloat = 60.0
        static let bottomBorder: CGFloat = 50.0
        static let colorAlpha: CGFloat = 0.3
        static let circleDiametr: CGFloat = 5.0
    }
    
   @IBInspectable var startColor: UIColor = .green
    @IBInspectable var endColor: UIColor = .blue
    
    var graphPoints: [Int] = [4, 3, 6, 4, 5, 8, 2]
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let width = rect.width
        let heigth = rect.height
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: Constants.cornerRadiusSize)
        path.addClip()
        
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let colorLocation: [CGFloat] = [0.0, 1.0]
        
        guard let gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: colors as CFArray,
            locations: colorLocation) else { return }
        
        var startPoint = CGPoint.zero
        
        var endPoint = CGPoint(x: 0, y: self.bounds.height)
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
        
        let margin = Constants.margin
        let topBorder: CGFloat = Constants.topBorder
        let bottomBorder: CGFloat = Constants.bottomBorder
        let graphHeidht = heigth - topBorder - bottomBorder
        
        let columXPoint = { (column: Int) -> CGFloat in
            let spacing = (width - margin * 2 - 4) / CGFloat((self.graphPoints.count - 1))
            return CGFloat(column) * spacing + margin + 2
        }
        
        
        guard let maxValue = graphPoints.max() else {return}
        
        let columYPoint = { (graphPoints: Int) -> CGFloat in
            let yPoint = CGFloat(graphPoints) / CGFloat(maxValue) * graphHeidht
            return graphHeidht + topBorder - yPoint
        }
        
        UIColor.white.setFill()
        UIColor.red.setStroke()
        
        let graphPath = UIBezierPath()
        
        graphPath.move(to: CGPoint(x: columXPoint(0), y: columYPoint(graphPoints[0])))
        
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x: columXPoint(i), y: columYPoint(graphPoints[i]))
            graphPath.addLine(to: nextPoint)
        }
        context.saveGState()
        
        guard let clippingPath = graphPath.copy() as? UIBezierPath else { return }
        
        clippingPath.addLine(to: CGPoint(x: columXPoint(graphPoints.count - 1), y: columYPoint(Int(heigth))))
        clippingPath.addLine(to: CGPoint(x: columXPoint(0), y: columYPoint(Int(heigth))))
        
        clippingPath.close()
        clippingPath.addClip()
        
        let highestYPoint = columYPoint(maxValue)
        
        startPoint = CGPoint(x: margin, y: highestYPoint)
        endPoint = CGPoint(x: margin, y: self.bounds.height)
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        
        context.restoreGState()
        
        graphPath.lineWidth = 2
        graphPath.stroke()
        
        
        for i in 0..<graphPoints.count {
            var point = CGPoint(x: columXPoint(i), y: columYPoint(graphPoints[i]))
            point.x -= Constants.circleDiametr / 2
            point.y -= Constants.circleDiametr / 2
            
            let circle = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: Constants.circleDiametr, height: Constants.circleDiametr)))
            circle.fill()
        }
        
        //
        let linePath = UIBezierPath()
        
        linePath.move(to: CGPoint(x: margin, y: topBorder))
        linePath.addLine(to: CGPoint(x: width - margin, y: topBorder))
        
        linePath.move(to: CGPoint(x: margin, y: graphHeidht / 2 + topBorder))
        linePath.addLine(to: CGPoint(x: width - margin, y: graphHeidht / 2 + topBorder))
        
        linePath.move(to: CGPoint(x: margin, y: heigth - bottomBorder))
        linePath.addLine(to: CGPoint(x: width - margin, y: heigth - bottomBorder))
        
        let color = UIColor(white: 1.0, alpha: Constants.colorAlpha)
        color.setStroke()
        linePath.lineWidth = 1.0
        linePath.stroke()
        
        
    }
    
    
    
}
