//
//  Categories.swift
//  QuizApp
//
//  Created by Kalaivani, Velusamy (623-Extern) on 10/06/19.
//  Copyright © 2019 Kalaivani, Velusamy (623-Extern). All rights reserved.
//
import Foundation

enum CategoryNames:String{
    case Geography = "Geography"
    case Art = "Art"
    case History = "History"
    case Politics = "Politics"
    case Entertainment
    case GeneralKnowledge
    
    var ID:Int{
        switch self {
        case .Geography:
            return 22
        case .History:
            return 23
        case .Politics:
            return 24
        default:
            return 23
        }
    }
    
    
}



class Category {
    
    var category:String?
    var id:Int?
    init(category:String,id:Int) {
        self.category=category
        self.id=id
    }
    
}


