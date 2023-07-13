//
//  Alerts.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 13.07.2023.
//

import UIKit

final class Alerts: NSObject {
    
    func showSimpleAlert(controller: UIViewController, title:String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("Cencel is pressed !")
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            print("Ok is pressed !")
        }))
        
        controller.present(alert, animated: true)
    }
    
    func showAlertWithSheets(controller: UIViewController, title:String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Default", style: .default, handler: { (_) in
            print("Default is pressed !")
        }))
        alert.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: { (_) in
            print("Destructive is pressed !")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("Cancel is pressed !")
        }))
        
        controller.present(alert, animated: true, completion: {print("Завдання виконане !")})
    }
    
    func showAlertWithTreeButton(controller: UIViewController, title:String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: { (_) in
            print("Edit is pressed !")
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            print("Delete is pressed !")
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("Dismiss is pressed !")
        }))
        
        controller.present(alert, animated: true, completion: {print("Завдання виконане !")})
    }
    
    func showAlertWithTextFied(controller: UIViewController, title:String){
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Add", style: .default){ _ in
            if let txtField = alert.textFields?.first, let text = txtField.text {
                print("Text from Alert -> \(text)")
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){_ in }
        alert.addTextField{(textField) in textField.placeholder = "Введіть ваш пароль"}
        
        alert.addAction(confirmAction)
        alert.addAction(cancel)
        
        controller.present(alert, animated: true, completion: nil)
    }
    
    
    
}
