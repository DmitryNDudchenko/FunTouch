//
//  CapCounterViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 25.07.2023.
//

import UIKit

class CapCounterViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    
    @IBOutlet weak var counterOFWater: UILabel!
    
    @IBOutlet weak var graphView: GraphView!
    
    @IBOutlet weak var containerView: UIView!
    
    //Тут міце для вашого graphView
    
    var isGraphViewShowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushButtonPressed(button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterOFWater.text = String(counterView.counter)
        
        if isGraphViewShowing {
            counterViewTap(nil)
        }
       
    }
    
    @IBAction func counterViewTap(_ sender: UITapGestureRecognizer?) {
        
        if isGraphViewShowing {
            UIView.transition(
                from: graphView,
                to: counterView,
                duration: 1.0,
                options: [.transitionFlipFromLeft, .showHideTransitionViews],
                completion: nil
            )
        } else {
            UIView.transition(
                from: counterView,
                to: graphView,
                duration: 1.0,
                options: [.transitionFlipFromLeft, .showHideTransitionViews],
                completion: nil
            )
        }
        isGraphViewShowing.toggle()
    }
    
}
