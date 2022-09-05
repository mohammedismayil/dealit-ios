//
//  CoreDataHandler.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 12/01/22.
//

import Foundation
import UIKit
import CoreData


enum CoreDataEntityEnum:String{
    case UserList
    case UserDetails
    case Products
}

enum APIName:String{
    case users
    case posts
    case comments
}
class CoreDataHandler{
    
    static let shared = CoreDataHandler()
    func createUsers(users:[HomeUserProfileModel]) ->[NSManagedObject]{
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        let temp = [HomeUserProfileCacheModel.init()]
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return temp}
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let’s create an entity and new user records.
        let userEntity = NSEntityDescription.entity(forEntityName: "UserList", in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        //here adding 5 data with loop
        var user = [NSManagedObject(entity: userEntity, insertInto: managedContext)]
        user.removeAll()
//        for _ in 0..<100{
//        for _ in 0..<1000{
            for i in 0..<users.count {
                let  curr = NSManagedObject(entity: userEntity, insertInto: managedContext)
                curr.setValue(users[i].name, forKey: "name")
    //
                curr.setValue(users[i].desc, forKey: "desc")
                curr.setValue(users[i].image, forKey: "image")
                print("here")
                print(users[i].name)
                user.append(curr)
                
//            }
//        }
        }
        
        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return user
    }
    
    
    func getData(for entity:CoreDataEntityEnum)->[JSON] {
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.rawValue)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
           
            
            
            
           
           
           let objs = result as! [NSManagedObject]
                var jsonArray: [JSON] = []
            var dict: [String: Any] = [:]
          
                for item in objs {
                   
                    for attribute in item.entity.attributesByName {
                        //check if value is present, then add key to dictionary so as to avoid the nil value crash
                        if let value = item.value(forKey: attribute.key) {
                            dict[attribute.key] = value
                        }
                    }
                    jsonArray.append(dict)
                }
                return jsonArray
           
                  
                
               
           
           return [JSON]()
         
        } catch {
            
            print("Failed")
        }
        
        return []
    }
    
    
    func saveRawResponse(API:APIName,response:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return }
        
        
        //We need to create a context from this container
        let managedContext = appDelegate.secondpersistentContainer.viewContext
        
        
        //Now let’s create an entity and new user records.
        let userEntity = NSEntityDescription.entity(forEntityName: "Response", in: managedContext)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        user.setValue(API.rawValue, forKey: "api")
        user.setValue(response, forKey: "json")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    func getRawResponse(API:APIName)->JSON{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return JSON()}
        
        
        //We need to create a context from this container
        let managedContext = appDelegate.secondpersistentContainer.viewContext
        
    
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Response")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
           
            
            
            
           
           
            
            let objs = result as! [NSManagedObject]
                 var jsonArray = JSON()
             var dict: [String: Any] = [:]
           
                 for item in objs {
                    
                     for attribute in item.entity.attributesByName {
                         //check if value is present, then add key to dictionary so as to avoid the nil value crash
                         if let value = item.value(forKey: attribute.key) {
                             dict[attribute.key] = value
                             jsonArray[attribute.key] = value
                         }
                     }
                    
                 }
                 return jsonArray
                
           
                  
          
         
        } catch {
            
            print("Failed")
        }
        return JSON()
    }
    

}
