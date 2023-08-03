//
//  EmojiTableViewCell.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 03.08.2023.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with emoji:Emojis){
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLable.text = emoji.description
    }
    

}
