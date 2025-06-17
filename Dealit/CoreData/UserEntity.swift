//
//  UserEntity.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 17/06/25.
//

import Foundation
import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {
  
}
extension UserEntity: Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
            return NSFetchRequest<UserEntity>(entityName: "UserEntity")
        }
}
