//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by Kalaivani, Velusamy (623-Extern) on 13/06/19.
//  Copyright © 2019 Kalaivani, Velusamy (623-Extern). All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreLbl: UILabel!
    
    var score:Int? = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showScore()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func showScore(){
        guard let score = score else{
            print("No score")
            return
        }
        self.scoreLbl.text = "\(self.score!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playBtnClicked(_ sender: UIButton) {
        
        if let categoryViewController = storyboard?.instantiateViewController(
            withIdentifier: "categoryVC")
            as? CategoryViewController  {
            present(categoryViewController, animated: true, completion: nil)
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
