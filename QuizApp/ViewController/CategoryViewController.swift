//
//  CategoryViewController.swift
//  QuizApp
//
//  Created by Kalaivani, Velusamy (623-Extern) on 10/06/19.
//  Copyright © 2019 Kalaivani, Velusamy (623-Extern). All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var thirdCategoryBtn: UIButton!
    @IBOutlet weak var secondCategoryBtn: UIButton!
    @IBOutlet weak var firstCategoryBtn: UIButton!
    
  let categoryOptions = ["GeneralKnowledge","Books","Film","Music","Musicals&Theatre","Television","Video Games","Board Games","Nature","Computers","Mathematics","Mythology","Sports","Geography","History","Politics","Art","Celebreties","Animals","Vehicles","Comics","Gadgets","Cartoon & Animations","Japanese Anima & Manga"]
    
    let categoryID=["GeneralKnowledge":CategoryNames.GeneralKnowledge.ID,
                    "Books":CategoryNames.entertainment(type: .Books).ID,
        "Film":CategoryNames.entertainment(type: .Film).ID,
        "Music":CategoryNames.entertainment(type: .Music).ID,
        "Musicals&Theatre":CategoryNames.entertainment(type: .MusicalsTheatre).ID,
        "Television":CategoryNames.entertainment(type: .Television).ID,
        "Video Games":CategoryNames.entertainment(type: .VideoGames).ID,
        "Board Games":CategoryNames.entertainment(type: .BoardGames).ID,
        "Nature":CategoryNames.science(type: .Nature).ID,
        "Computers":CategoryNames.science(type: .Computers).ID,
        "Mathematics":CategoryNames.science(type: .Mathematics).ID,
        "Gadgets":CategoryNames.science(type: .Gadgets).ID,
        "Mythology":CategoryNames.Mythology.ID,
        "Sports":CategoryNames.Sports.ID,
        "Geography":CategoryNames.Geography.ID,
        "History":CategoryNames.History.ID,
        "Politics":CategoryNames.Politics.ID,
        "Art":CategoryNames.Art.ID,
        "Celebreties":CategoryNames.Celebreties.ID,
        "Animals":CategoryNames.Animals.ID,
        "Vehicles":CategoryNames.Vehicles.ID,
        "Comics":CategoryNames.entertainment(type: .Comics).ID,
        "Cartoon & Animations":CategoryNames.entertainment(type: .CartoonAndAnimations).ID,
        "Japanese Anima & Manga":CategoryNames.entertainment(type: .JapaneseAnimaManga).ID
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let firstBtn = getRandomNumber()
        let secondBtn = getRandomNumber()
        let thirdBtn = getRandomNumber()
        
        customizeButtons()
        firstCategoryBtn.setTitle(categoryOptions[firstBtn], for: .normal)
        secondCategoryBtn.setTitle(categoryOptions[secondBtn], for: .normal)
        thirdCategoryBtn.setTitle(categoryOptions[thirdBtn], for: .normal)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRandomNumber()->Int{
        return Int(arc4random_uniform(uint(categoryOptions.count)))
    }
    
    func customizeButtons(){
        firstCategoryBtn.layer.cornerRadius = 5.0
        secondCategoryBtn.layer.cornerRadius = 5.0
        thirdCategoryBtn.layer.cornerRadius = 5.0
    }

    @IBAction func categoryBtnClicked(_ sender: UIButton) {
        
        let enumVal = categoryID[(sender.titleLabel?.text)!]
        print (enumVal)
        

        if let questionsViewController = storyboard?.instantiateViewController(
            withIdentifier: "QuestionsViewController")
            as? ViewController  {
            questionsViewController.categoryId=enumVal!
            questionsViewController.categoryName = sender.titleLabel?.text
            present(questionsViewController, animated: true, completion: nil)
        }
        
    }
   

}
