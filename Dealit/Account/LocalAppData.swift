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
  
    static func getValue(key :UserDefaultsKeys) -> String{
        return  UserDefaults.standard.value(forKey: key.rawValue) as? String ?? ""
    }
    static func setValue(key :UserDefaultsKeys,value:String){
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    
    
    static func getUserStatus()->UserStatus{
        
        
        switch UserStatus(rawValue:LocalAppData.getValue(key: .isloggedin)){
        case .loggedIn:
            return .loggedIn
            
        case .notloggedIn:
            return .notloggedIn
        default:
            return .notloggedIn
        }
    }
    
    static func setUserStatus(status:UserStatus){
        switch status {
        case .loggedIn:
            LocalAppData.setValue(key: .isloggedin, value: "loggedIn")
        case .notloggedIn:
            LocalAppData.setValue(key: .isloggedin, value: "notloggedIn")
        }
    }
}
