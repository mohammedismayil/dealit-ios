//
//  DemoPaginationUser+CoreDataProperties.swift
//  Dealit
//
//  Created by ismayil-16441 on 05/12/23.
//
//

import Foundation
import CoreData


extension DemoPaginationUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DemoPaginationUser> {
        return NSFetchRequest<DemoPaginationUser>(entityName: "DemoPaginationUser")
    }

    @NSManaged public var name: String?

}

extension DemoPaginationUser : Identifiable {

}
