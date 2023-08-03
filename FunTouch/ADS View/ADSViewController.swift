//
//  ADSViewController.swift
//  FunTouch
//
//  Created by Dmitry Dudchenko on 01.08.2023.
//

import UIKit
import GoogleMobileAds

class ADSViewController: UIViewController {

    struct Constants {
        static let homeADID = "ca-app-pub-3940256099942544/4411468910"
    }
    
    
    
    private var interstitial: GADInterstitialAd?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let request = GADRequest()
//        
//        GADInterstitialAd.load(withAdUnitID: Constants.homeADID, request: request, completionHandler: { [self] ad, error in
//            if let error = error {
//                print("Failed to load interstitial ADs with errro: \(error.localizedDescription)")
//                return
//            }
//            interstitial = ad
//            interstitial?.fullScreenContentDelegate = self
//        })
        
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
    @IBAction func runGoogleADS(_ sender: UIButton) {
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
        }else {
            print("Ad wasnt ready")
        }
    }
    
}
extension ADSViewController: GADFullScreenContentDelegate {
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full sceen content !")
    }
    
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will presrnt full screen contetn !")
    }
    
    func adWillDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screeen content !")
    }
    
}
