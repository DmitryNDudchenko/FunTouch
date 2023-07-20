//
//  DrowSimpleLine.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 20.07.2023.
//

import UIKit

@IBDesignable
class DrowSimpleLine: UIView {

    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
            
        }
        
//        let myShadowOffSet = CGSize(width: -10, height: 15)
//        context.saveGState()
//
//        context.setShadow(offset: myShadowOffSet, blur: 5)
//
//        context.setLineWidth(4.0)
        
//        let dashArray: [CGFloat] = [2,6,4,2]
//
//        context.setLineDash(phase: 3, lengths: dashArray)
        
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
//        let color = CGColor(colorSpace: colorSpace, components: components)
        
        //context.setStrokeColor(color!)
        //context.setStrokeColor(UIColor.red.cgColor)
        
        //Пряма лінія
//        context.move(to: CGPoint(x: 50, y: 50))
//        context.addLine(to: CGPoint(x: 300, y: 400))
        
        // Прямокутный робм
//        context.move(to: CGPoint(x: 100, y: 100))
//        context.addLine(to: CGPoint(x: 150, y: 150))
//        context.addLine(to: CGPoint(x: 100, y: 200))
//        context.addLine(to: CGPoint(x: 50, y: 150))
//        context.addLine(to: CGPoint(x: 100, y: 100))

        //малювання Еліпсу
//        let rectangle = CGRect(x: 50, y: 50, width: 200, height: 80)
//        context.addEllipse(in: rectangle)
//
        // Прямокутник с заповненням
//        let rectangle = CGRect(x: 50, y: 50, width: 200, height: 80)
//        context.addRect(rectangle)
//        context.strokePath()
//        context.setFillColor(UIColor.white.cgColor)
//        context.fill(rectangle)
        
        //Малювання кривої
//        context.move(to: CGPoint(x: 100, y: 100))
//        context.addArc(tangent1End: CGPoint(x: 100, y: 200), tangent2End: CGPoint(x: 300, y: 200), radius: 100)
        
        //Крива Бизье
//        context.move(to: CGPoint(x: 30, y: 30))
//        context.addCurve(to: CGPoint(x: 20, y: 50), control1: CGPoint(x: 300, y: 250), control2: CGPoint(x: 300, y: 70))
    
        //малювання скруглення зі штриховкою
//        context.move(to: CGPoint(x: 30, y: 300))
//        context.addQuadCurve(to: CGPoint(x: 300, y: 200), control: CGPoint(x: 150, y: 30))
        
        
        let rectangle = CGRect(x: 50, y: 50, width: 200, height: 80)
        context.addEllipse(in: rectangle)
        context.strokePath()
        context.restoreGState()
        
        
    }

}
