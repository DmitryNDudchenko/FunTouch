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
            alpha: 1.0
        )
    }
}

final class ColorRepository {
    lazy var colors: [UIColor] = {
        (0...100).map { _ in
            UIColor.random
        }
    }()
    
    lazy var letters: [Character] = {
        let aScalars = "a".unicodeScalars
        let aCode = aScalars[aScalars.startIndex].value
        
        return (0..<26).map { i in
            Character(Unicode.Scalar(aCode + i) ?? aScalars[aScalars.startIndex])
        }
    }()
}
