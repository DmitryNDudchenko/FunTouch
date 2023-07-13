//
//  CustomView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 23.06.2023.
//

import UIKit

class CustomView: UIView{
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
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
        commonInit()
    }
    private func commonInit(){
        imageView.backgroundColor = .green
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 2
    }
    
    private func setupContentView(){
        Bundle.main.loadNibNamed(String(describing: CustomView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
