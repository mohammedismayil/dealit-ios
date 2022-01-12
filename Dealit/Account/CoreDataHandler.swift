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
        for i in 0..<users.count {
            let  curr = NSManagedObject(entity: userEntity, insertInto: managedContext)
            curr.setValue(users[i].desc, forKey: "desc")
            
            curr.setValue(users[i].name, forKey: "name")
            curr.setValue(users[i].image, forKey: "image")
            
            
            user.append(curr)
            
        }
        
        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return user
    }
    
    
    func getUserList()->[HomeUserProfileModel]{
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [HomeUserProfileModel.init(desc: "", name: "", image: "")]}
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserList")
        var temp = [HomeUserProfileModel.init(desc: "", name: "", image: "")]
        temp.removeAll()
        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
//                temp.append(HomeUserProfileModel.init(desc: data.value(forKey: "desc") as! String, name: data.value(forKey: "name") as! String, image: data.value(forKey: "image") as! String))
            }
            return temp
            
        } catch {
            
            print("Failed")
        }
        return [HomeUserProfileModel.init(desc: "", name: "", image: "")]
    }
}
