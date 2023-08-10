//
//  SupplementaryView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 08.08.2023.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    
    private(set) lazy var label = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}

final class Spacer: UICollectionReusableView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

final class LetterCell: UICollectionViewCell {
    
    private(set) lazy var letterLabel = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    private func setupViews() {
        contentView.addSubview(letterLabel)
        
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            letterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            letterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        layer.borderWidth = 2
        layer.cornerRadius = 15
        layer.borderColor = UIColor.black.cgColor
        
        
    }
    
    
}
