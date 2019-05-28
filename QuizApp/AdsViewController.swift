//
//  AdsViewController.swift
//  QuizApp
//
//  Created by Kalaivani, Velusamy (623-Extern) on 28/05/19.
//  Copyright © 2019 Kalaivani, Velusamy (623-Extern). All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdsViewController: UIViewController,GADInterstitialDelegate {
    
    var interstitialAd : GADInterstitial!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAd()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setUpAd(){
        //interstitial Ad
        //ca-app-pub-3313120708713385/7501886898
        self.interstitialAd = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID,"2077ef9a63d2b398840261c8221a0c9b"]
        self.interstitialAd.load(request)
        self.interstitialAd = reloadInterstitialAd()
    }
    
    private func interstitialDidDismissScreen(ad: GADInterstitial!) {
        self.interstitialAd = reloadInterstitialAd()
    }
    
    func reloadInterstitialAd() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func showAd(_ sender: Any) {
        
        if self.interstitialAd.isReady {
            self.interstitialAd.present(fromRootViewController: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
