//
//  AddFavorites+CoreDataProperties.swift
//  SellAssignment
//
//  Created by Thejeswara Reddy on 23/03/21.
//
//

import Foundation
import CoreData


extension AddFavorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddFavorites> {
        return NSFetchRequest<AddFavorites>(entityName: "AddFavorites")
    }

    @NSManaged public var emailid: String?

}

extension AddFavorites : Identifiable {

}
