//
//  Model.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 08.08.2023.
//

import UIKit
extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0)
    }
}

final class ColorRepository{
   lazy var color: [UIColor] = {
        (0...100).map {_ in
            UIColor.random
        }
    }()
    
   lazy var letters: [Character] = {
        let aScalers = "a".unicodeScalars
        let aCode = aScalers[aScalers.startIndex].value
        
        return (0..<26).map { i in
            Character(Unicode.Scalar(aCode + i) ?? aScalers[aScalers.startIndex])
        }
    }()
}
