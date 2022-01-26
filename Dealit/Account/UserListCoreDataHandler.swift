//
//  UserListCoreDataHandler.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 25/01/22.
//

import Foundation
import UIKit
import CoreData
class UserlistCoreDataHandler{
    
    static let shared = UserlistCoreDataHandler()
    
    func getUserList()->[HomeUserProfileModel]{
        
        
        let handler = CoreDataHandler.shared
        
        let list = handler.getData(for: .UserList )
        
        
        var userlist = [HomeUserProfileModel(desc: "", name: "", image: "")]
        userlist.removeAll()
        for list in list {
            
            if !list.isEmpty{
                userlist.append(HomeUserProfileModel(json: list))
            }
            
        }
        
        
        return userlist
    }
}
