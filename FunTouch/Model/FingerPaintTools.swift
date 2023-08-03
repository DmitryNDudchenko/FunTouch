//
//  FingerPaintTools.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 20.07.2023.
//

import UIKit

class FingerPaintTools: UIView {

    private struct Line {
        var startPoint: CGPoint
        var endPoint: CGPoint
    }
    
    var lastPoint: CGPoint!
    private var lines = [Line]()
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        for line in lines {
            context.beginPath()
            context.move(to: line.startPoint)
            context.addLine(to: line.endPoint)
            context.setLineCap(.round)
            context.setStrokeColor(UIColor.white.cgColor)
            context.setFillColor(UIColor.white.cgColor)
            context.setLineWidth(8.0)
            context.strokePath()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            lastPoint = touch.location(in: self)
            lines.append(Line(startPoint: lastPoint, endPoint: lastPoint))
            self.setNeedsDisplay()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let newPoint = touch.location(in: self)
            lines.append(Line(startPoint: lastPoint, endPoint: newPoint))
            lastPoint = newPoint
            self.setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //clearView()
    }

    func clearView(){
        lines = [Line]()
        self.setNeedsDisplay()
    }
    
    
}
