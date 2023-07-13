//
//  GradientView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 27.06.2023.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    var gradientLayer = CAGradientLayer()
    
   @IBInspectable var topColor: UIColor = #colorLiteral(red: 0, green: 0.8640472889, blue: 0.9947116971, alpha: 1) {
        didSet {
            gradientLayer.colors = [topColor.cgColor, topButton.cgColor]
        }
    }
    
    @IBInspectable var topButton: UIColor = #colorLiteral(red: 0.1377131641, green: 0.4835600853, blue: 0.9543099999, alpha: 1) {
        didSet {
            gradientLayer.colors = [topColor.cgColor, topButton.cgColor]
        }
    }
    
    @IBInspectable var startDirection: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            gradientLayer.startPoint = startDirection
        }
    }
    
    @IBInspectable var endDirection: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            gradientLayer.startPoint = endDirection
        }
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
