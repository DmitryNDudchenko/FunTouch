//
//  CapCounterViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 25.07.2023.
//

import UIKit

class CapCounterViewController: UIViewController {

    @IBOutlet weak var stackDateLabel: UIStackView!
    @IBOutlet weak var counterView: CounterView!
    
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var counterOFWater: UILabel!
    
    @IBOutlet weak var graphView: GraphView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var avarage: UILabel!
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
            setupGraphDisplay()
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
    
    func setupGraphDisplay() {
        let maxDayIndex = stackDateLabel.arrangedSubviews.count - 1
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
        graphView.setNeedsDisplay()
        maxLabel.text = String(Constants.numberOfGlasses)
        
        let average = graphView.graphPoints.reduce(0, + ) / graphView.graphPoints.count
        avarage.text = "\(average)"
        
        let today = Date()
        
        let celendar = Calendar.current
        
        let formatter  = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEEE")
        
        for i in (0...maxDayIndex) {
            if let date = celendar.date(byAdding: .day, value: -i, to: today),
               let label = stackDateLabel.arrangedSubviews[maxDayIndex - i] as? UILabel {
                label.text = formatter.string(from: date)
            }
        }
        
        
    }
}
