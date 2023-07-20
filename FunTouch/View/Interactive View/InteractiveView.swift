//
//  InteractiveView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 20.07.2023.
//

import UIKit

class InteractiveView: UIViewController {
    
    @IBOutlet weak var buttonNextView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Interactive View"
        
        ViewConfig.instance.configButton(buttonNextView)
        // Do any additional setup after loading the view.
    }

    @IBAction func goToNextView(_ sender: UIButton) {
        
    }

}
