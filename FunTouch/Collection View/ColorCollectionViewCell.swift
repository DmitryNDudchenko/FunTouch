//
//  ColorCollectionViewCell.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 08.08.2023.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorsImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func update(with colors: Colors){
        colorsImageView.tintColor = colors.image
        titleLabel.text = colors.title
    }
    
}
