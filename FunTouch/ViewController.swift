//
//  ViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 09.12.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var buttonContin: UIButton!
    
    let generator = UIImpactFeedbackGenerator(style: .heavy) //Инициализация обьекта UIImpactFeedbackGenerator для фидбека вибрацией. Параметр style: определяет тип виброотклика

    override func viewDidLoad() {
        super.viewDidLoad()

        //swipeNavigation()

    }

    private func swipeNavigation(){
        let swipeUP = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeUP.direction = .up
        self.view.addGestureRecognizer(swipeUP)

    }

    @IBAction func goToStartPage(_ sender: UIButton) {
        let mainView = RegistrationViewController()
        navigationController?.pushViewController(mainView, animated: true)
    }
    
    @IBAction func buttonNavigation(_ sender: UIButton) {
        generator.impactOccurred() //Имплементация виброотклика по нажатию кнопки
    }

    @IBAction func goToAnotherXibView(_ sender: UIButton) {
        let anotherView = NoteViewController()
        
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    @objc private func swipeFunc(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .up {

            generator.impactOccurred() // Инициализация виброотклика при свайпе вверх 
            performSegue(withIdentifier: "upID", sender: self)

        }
    }

    @IBAction func goToXibView(_ sender: UIButton) {
        let anotherView = AnotherXibViewController()
        
        navigationController?.pushViewController(anotherView, animated: true)
    }
    

}

