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
    
    func getUserList()->[[String:Any]]{
        
        
        let handler = CoreDataHandler.shared
        
        let list = handler.getData(for: .UserList )
        
        
        return list
    }
}
