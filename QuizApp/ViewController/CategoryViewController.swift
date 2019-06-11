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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstCategoryBtn.titleLabel?.text = "\(CategoryNames.Geography)"
        secondCategoryBtn.titleLabel?.text = "\(CategoryNames.History.rawValue)"
        thirdCategoryBtn.titleLabel?.text = "\(CategoryNames.Politics.rawValue)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func categoryBtnClicked(_ sender: UIButton) {
        
        let enumVal = CategoryNames(rawValue:(sender.titleLabel?.text)!)

        
//        let adVC=ViewController()
//
//        switch sender.tag {
//        case 0:
//            let enumVal = CategoryNames(rawValue:(firstCategoryBtn.titleLabel?.text)!)
//            adVC.categoryId = (enumVal?.ID)!
//            print(enumVal?.ID)
//        case 1:
//            let enumVal = CategoryNames(rawValue:(secondCategoryBtn.titleLabel?.text)!)
//            adVC.categoryId = (enumVal?.ID)!
//            print(enumVal?.ID)
//        case 2:
//            let enumVal = CategoryNames(rawValue:(thirdCategoryBtn.titleLabel?.text)!)
//            adVC.categoryId = (enumVal?.ID)!
//            print(enumVal?.ID)
//        default:
//            20
//        }
        if let questionsViewController = storyboard?.instantiateViewController(
            withIdentifier: "QuestionsViewController")
            as? ViewController  {
            questionsViewController.categoryId=(enumVal?.ID)!
            questionsViewController.categoryName = sender.titleLabel?.text
            present(questionsViewController, animated: true, completion: nil)
        }
        
    }
   

}
