//
//  CoreDataHandler.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 12/01/22.
//

import Foundation
import UIKit
import CoreData

class CoreDataHandler{
    
    static let shared = CoreDataHandler()
    func createUsers(users:[HomeUserProfileModel]) ->[HomeUserProfileCacheModel]{
            
            //As we know that container is set up in the AppDelegates so we need to refer that container.
        let temp = [HomeUserProfileCacheModel.init()]
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return temp}
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Now let’s create an entity and new user records.
            let userEntity = NSEntityDescription.entity(forEntityName: "HomePageUsers", in: managedContext)!
            
            //final, we need to add some data to our newly created record for each keys using
            //here adding 5 data with loop
        let user = [HomeUserProfileCacheModel.init(entity: userEntity, insertInto: managedContext)]
        for i in 0..<users.count {
            user.append(user)
            user[i].setValue(users[i].name, forKey: "name")
            user[i].setValue(users[i].image, forKey: "image")
            user[i].setValue(users[i].desc, forKey: "desc")
            
            
         
            }

            //Now we have set all the values. The next step is to save them inside the Core Data
            
            do {
                try managedContext.save()
               
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        
        return user
        }
}
