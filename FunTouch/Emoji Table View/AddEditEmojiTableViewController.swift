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
    }

    init?(coder: NSCoder, emoji: Emojis?){
        self.emoji = emoji
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
