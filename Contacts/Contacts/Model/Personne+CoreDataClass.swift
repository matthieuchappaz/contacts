//
//  Personne+CoreDataClass.swift
//  
//
//  Created by Lagarde Quentin on 19/10/2016.
//
//

import Foundation
import CoreData


public class Personne: NSManagedObject {

    static let dateFormatter = initializeFormatter();

    var prenoms :[String] {
        get {
            return [self.prenom1!, self.prenom2!, self.prenom3!];
        }
        set {
            self.prenom1 = newValue[0];
            self.prenom2 = newValue[1];
            self.prenom3 = newValue[2];
        }
    }
    
    var patronyme :String {
        get {
            return self.prenom1! + " " + self.nom!;
        }
    }
    
    var formattedDate :String {
        get {
            return Personne.dateFormatter.string(from: self.dateNaissance as! Date);
        }
    }
    
    var autresPrenoms :String {
        get {
            let autresPrenomsArray = self.prenoms[1..<self.prenoms.count];
            return autresPrenomsArray.joined(separator: ", ");
        }
    }
    
}

private func initializeFormatter() -> DateFormatter {
    let formatter = DateFormatter();
    formatter.dateStyle = .medium;
    return formatter;
}
