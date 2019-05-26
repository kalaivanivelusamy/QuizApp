//
//  QuestionsModel.swift
//  QuizApp
//

import Foundation
class Questions{
    
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
