//
//  LocalAppData.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 09/01/22.
//

import Foundation

enum UserDefaultsKeys:String{
   case isloggedin
}
class LocalAppData {
  
    static func getValue(key :UserDefaultsKeys) -> UserDefaultsKeys{
        return UserDefaultsKeys(rawValue: UserDefaults.standard.value(forKey: key.rawValue) as! String)!
    }
    static func setValue(key :UserDefaultsKeys,value:String){
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    
    
    func getUserStatus()->UserStatus{
        
        
        switch UserStatus(rawValue:LocalAppData.getValue(key: .isloggedin).rawValue){
        case .loggedIn:
            return .loggedIn
            
        case .notloggedIn:
            return .notloggedIn
        default:
            return .notloggedIn
        }
    }
    
    func setUserStatus(status:UserStatus){
        switch status {
        case .loggedIn:
            LocalAppData.setValue(key: .isloggedin, value: "true")
        case .notloggedIn:
            LocalAppData.setValue(key: .isloggedin, value: "false")
        }
    }
}
