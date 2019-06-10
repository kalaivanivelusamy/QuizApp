//
//  Categories.swift
//  QuizApp
//
//  Created by Kalaivani, Velusamy (623-Extern) on 10/06/19.
//  Copyright © 2019 Kalaivani, Velusamy (623-Extern). All rights reserved.
//

import Foundation
class Category{
    
    var category:String?
    var correctAnswer:String?
    var difficulty:String?
    var incorrectAnswers:[String]?
    var question:String?
    var type:String?
    
    init(category:String,qtn:String,ans:String,wrongAns:[String],type:String,difficulty:String) {
        self.question = qtn
        self.correctAnswer = ans
        self.incorrectAnswers = wrongAns
        self.category=category
        self.type=type
    }
    
}
