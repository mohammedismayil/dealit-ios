//
//  ProductsCoreDataHandler.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 17/02/22.
//
import Foundation
import UIKit
import CoreData
class ProductsCoreDataHandler{
    
    static let shared = ProductsCoreDataHandler()
    
    func getProducts()->[Product]{
        
        
        let handler = CoreDataHandler.shared
        
        let list = handler.getData(for: .Products )
        
        
        var userlist = [Product(name: "", price: 0, image: "")]
        userlist.removeAll()
        for list in list {
            
            if !list.isEmpty{
                userlist.append(Product(json: list))
            }
            
        }
        
        
        return userlist
    }
}
