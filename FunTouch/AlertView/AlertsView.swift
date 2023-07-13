//
//  AlertsView.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 13.07.2023.
//

import UIKit

class AlertsView: UIViewController {

        private var alert = Alerts()
    
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }

        @IBAction func simpleAlerts(_ sender: UIButton) {
            alert.showSimpleAlert(controller: self, title: "Реестрація", message: "По натисканню ви будете зареестровані")
        }
        
    @IBAction func simpleAlertsWithSheets(_ sender: UIButton) {
        alert.showAlertWithSheets(controller: self, title: "Menu", message: "Оберіть один з варіантів")
    }
    
    @IBAction func simpleAlertsWithTreeButton(_ sender: UIButton) {
        alert.showAlertWithTreeButton(controller: self, title: "Alert", message: "Alert with tree button")
    }
    
    
    @IBAction func simpleAlertsWithTextField(_ sender: UIButton) {
        alert.showAlertWithTextFied(controller: self, title: "Alert with text field")
    }
    
}
