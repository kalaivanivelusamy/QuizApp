//
//  Categories.swift
//  QuizApp
//
//  Created by Kalaivani, Velusamy (623-Extern) on 10/06/19.
//  Copyright © 2019 Kalaivani, Velusamy (623-Extern). All rights reserved.
//
import Foundation



enum EntertainmentType:String{
    case Books //10
    case Film //11
    case Music //12
    case MusicalsTheatre //13
    case Television //14
    case VideoGames  //15
    case BoardGames  //16
    case Comics //29
    case CartoonAndAnimations //31
    case JapaneseAnimaManga //32
    
}

enum ScienceType:String{
    case Nature = "Science&Nature" //17
    case Computers = "Science:Computers" //18
    case Mathematics = "Science:Mathematics" //19
    case Gadgets //30
}


enum CategoryNames{
   
    case entertainment(type:EntertainmentType)
    case science(type:ScienceType)
    case GeneralKnowledge //= "GeneralKnowledge" 9
    case Mythology //= "Mythology" //20
    case Sports //= "Sports" //. 21
    case Geography // = "Geography"//.  22
    case History  //= "History" //. 23
    case Politics  //= "Politics" //. 24
    case Art  //= "Art" //.25
    case Celebreties  //= "Celebreties" //. 26
    case Animals  //= "Animals" //.  27
    case Vehicles // = "Vehicles" //.  28

    
    
    var ID:Int{ //category codes
        
        switch self {
        
        case .GeneralKnowledge:
            return 9
        case .entertainment(type: EntertainmentType.Books):
            return 10
        case .entertainment(type: EntertainmentType.Film):
            return 11
        case .entertainment(type: EntertainmentType.Music):
            return 12
        case .entertainment(type: EntertainmentType.MusicalsTheatre):
            return 13
        case .entertainment(type: EntertainmentType.Television):
            return 14
        case .entertainment(type: EntertainmentType.VideoGames):
            return 15
        case .entertainment(type: EntertainmentType.BoardGames):
            return 16
        case .entertainment(type: EntertainmentType.Comics):
            return 29
        case .entertainment(type: EntertainmentType.CartoonAndAnimations):
            return 31
        case .entertainment(type: EntertainmentType.JapaneseAnimaManga):
            return 32
            
        case .science(type: ScienceType.Nature):
            return 17
        case .science(type: ScienceType.Computers):
            return 18
        case .science(type: ScienceType.Mathematics):
            return 19
            
            
        case .Mythology:
            return 20
        case .Sports:
            return 21
        case .Geography:
            return 22
        case .History:
            return 23
        case .Politics:
            return 24
        case .Art:
            return 25
        case .Celebreties:
            return 26
        case .Animals:
            return 27
        case .Vehicles:
            return 28
        case .science(type: .Gadgets):
            return 30
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


