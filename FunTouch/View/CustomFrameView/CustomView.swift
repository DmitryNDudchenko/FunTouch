//
//  CustomView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 08.06.2023.
//

import UIKit

class CustomView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupContentView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    private func setupContentView() {
     
    }
}

