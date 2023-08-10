//
//  AddEditEmojiTableViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 03.08.2023.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {

    var emoji: Emojis?

    @IBOutlet weak var saveButton: UIBarButtonItem!

    @IBOutlet weak var symbolTextField: UITextField!

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var descriptionTextField: UITextField!

    @IBOutlet weak var usageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
            title = "Edit Emoji"
        } else {
            title = "Add Emoji"
        }
        
        updateSaveButtonState()
    }

    init?(coder: NSCoder, emoji: Emojis?){
        self.emoji = emoji
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSaveButtonState(){
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        let usageText = usageTextField.text ?? ""
        
        saveButton.isEnabled = !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty && containSingleEmoji(symbolTextField)
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField){
        updateSaveButtonState()
    }
    
    func containSingleEmoji(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text, text.count == 1 else { return false }
        
        let isCombinedIntoEmoji = text.unicodeScalars.count > 1 && text.unicodeScalars.first?.properties.isEmoji ?? false
        let isEmojiPresentation = text.unicodeScalars.first?.properties.isEmojiPresentation ?? false
        
        return isCombinedIntoEmoji || isEmojiPresentation
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let usege = usageTextField.text ?? ""
        
        emoji = Emojis(symbol: symbol, name: name, description: description, usage: usege)
    }
    
}
