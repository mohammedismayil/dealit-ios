//
//  HomePageModels.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 10/01/22.
//

import Foundation
import CoreData

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
    
    init(json:JSON){
        self.desc = json["desc"] as? String ?? ""
        self.name = json["name"] as? String ?? ""
        self.image = json["image"] as? String ?? ""
    }
}

@objc(HomeUserProfileCacheModel)
class HomeUserProfileCacheModel:NSManagedObject{
    @NSManaged  var name:String?
    @NSManaged  var desc:String?
    @NSManaged  var image:String?
}

//{
//"users": [
//{
//"name": "mahela",
//"desc": "Cool AF",
//"image": "https://randomuser.me/api/portraits/women/79.jpg"
//}
//]
//}
