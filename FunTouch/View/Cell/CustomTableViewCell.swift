//
//  CustomTableViewCell.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 08.06.2023.
//

import UIKit

struct ViewModel {
    var imageURL: String
    var title: String
    var subtitle: String
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customImageView: UIImageView!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topLabel.text = "Дмитро"
        bottomLabel.text = "Миколайович"
    }

    func configure(for viewModel: ViewModel){
        topLabel.text = viewModel.title
        bottomLabel.text = viewModel.subtitle
    }
    
}
