//
//  Pays+CoreDataProperties.swift
//  
//
//  Created by Lagarde Quentin on 19/10/2016.
//
//

import Foundation
import CoreData
 

extension Pays {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pays> {
        return NSFetchRequest<Pays>(entityName: "Pays");
    }

    @NSManaged public var nom: String?
    @NSManaged public var gentile: String?
    @NSManaged public var personne: NSSet?

}

// MARK: Generated accessors for personne
extension Pays {

    @objc(addPersonneObject:)
    @NSManaged public func addToPersonne(_ value: Personne)

    @objc(removePersonneObject:)
    @NSManaged public func removeFromPersonne(_ value: Personne)

    @objc(addPersonne:)
    @NSManaged public func addToPersonne(_ values: NSSet)

    @objc(removePersonne:)
    @NSManaged public func removeFromPersonne(_ values: NSSet)

}
