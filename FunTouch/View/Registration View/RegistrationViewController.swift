//
//  RegistrationViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 27.06.2023.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var topLable: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurationViewObject()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(sender:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(sender:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification){
        self.view.frame.origin.y = -140
    }
    @objc func keyboardWillHide(sender: NSNotification){
        self.view.frame.origin.y = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField || textField == ageTextField || textField == emailTextField {
            textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField || textField == ageTextField || textField == emailTextField {
            textField.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3991717408)
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == nameTextField {
            let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZабвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true 
    }
    
    
    func configurationViewObject(){
        ViewConfig.instance.configTextField(nameTextField)
        ViewConfig.instance.configTextField(ageTextField)
        ViewConfig.instance.configTextField(emailTextField)
        ViewConfig.instance.configButton(registrationButton)
        
        topLable.adjustsFontSizeToFitWidth = true
        topLable.minimumScaleFactor = 0.5
        
        nameTextField.delegate = self
        ageTextField.delegate = self
        emailTextField.delegate = self
        
    }


    
    
    
    
}
