//
//  ViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 09.12.2022.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var buttonContin: UIButton!
    
    let generator = UIImpactFeedbackGenerator(style: .heavy)

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
       
        let isReg = UserDefaults.standard.bool(forKey: "isReg")
        print(isReg)
        
        let nextView: UIViewController
        
        isReg == true ? (nextView = InteractiveView()) : (nextView = RegistrationViewController())
        
        navigationController?.pushViewController(nextView, animated: true)
        
    }
    
    @IBAction func buttonNavigation(_ sender: UIButton) {
        generator.impactOccurred()
    }

    @IBAction func goToAnotherXibView(_ sender: UIButton) {
        let anotherView = NoteViewController()
        
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    
    @IBAction func moveToAlertsView(_ sender: UIButton) {
        let alertsVC = AlertsView()
        navigationController?.pushViewController(alertsVC, animated: true)
    }
    
    @objc private func swipeFunc(gesture: UISwipeGestureRecognizer){
        if gesture.direction == .up {

            generator.impactOccurred()
            performSegue(withIdentifier: "upID", sender: self)

        }
    }

    @IBAction func goToXibView(_ sender: UIButton) {
        let anotherView = AnotherXibViewController()
        
        navigationController?.pushViewController(anotherView, animated: true)
    }
    

}

