//
//  HomePageModels.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 10/01/22.
//

import Foundation

class HomePageModel:Codable{
    var users:[HomeUserProfileModel]
}
class HomeUserProfileModel:Codable{
    var name:String
    var desc:String
    var image:String
    
    init(desc:String,name:String,image:String){
        self.desc = desc
        self.name = name
        self.image = image
    }
}
