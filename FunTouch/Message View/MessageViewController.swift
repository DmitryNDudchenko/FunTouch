//
//  MessageViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 01.08.2023.
//

import UIKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func movetoADSView(_ sender: UIButton) {
        let nextView: UIViewController = ADSViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
}
