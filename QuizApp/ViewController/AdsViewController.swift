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
    var totalAnswers:Int = 0
    let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")

    @IBOutlet weak var scoreLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial.delegate = self
        setUpAd()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.view.backgroundColor = UIColor.yellow
       self.scoreLbl?.text = "\(totalAnswers)"
        
        showAd()
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
       // self.interstitialAd = reloadInterstitialAd()
        
        if let questionsViewController = storyboard?.instantiateViewController(
            withIdentifier: "scoreVC")
            as? ScoreViewController  {
            
            questionsViewController.score=10
            present(questionsViewController, animated: true, completion: nil)
        }
        

        
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        self.interstitialAd.present(fromRootViewController: self)
    }

    func reloadInterstitialAd() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
   public func showAd() {
        
        if (self.interstitialAd.hasBeenUsed == false && self.interstitialAd.isReady) {
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
