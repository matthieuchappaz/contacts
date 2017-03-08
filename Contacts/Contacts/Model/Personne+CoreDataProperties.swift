//
//  Personne+CoreDataProperties.swift
//  
//
//  Created by Matthieu Chappaz on 20/10/2016.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData 

extension Personne {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Personne> {
        return NSFetchRequest<Personne>(entityName: "Personne");
    }

    @NSManaged public var dateNaissance: NSDate?
    @NSManaged public var nom: String?
    @NSManaged public var prenom1: String?
    @NSManaged public var prenom2: String?
    @NSManaged public var prenom3: String?
    @NSManaged public var imageProfil: NSData?
    @NSManaged public var pays: NSSet?

}

// MARK: Generated accessors for pays
extension Personne {

    @objc(addPaysObject:)
    @NSManaged public func addToPays(_ value: Pays)

    @objc(removePaysObject:)
    @NSManaged public func removeFromPays(_ value: Pays)

    @objc(addPays:)
    @NSManaged public func addToPays(_ values: NSSet)

    @objc(removePays:)
    @NSManaged public func removeFromPays(_ values: NSSet)

}
