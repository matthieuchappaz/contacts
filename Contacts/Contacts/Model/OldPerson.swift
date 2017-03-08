//
//  Personne.swift
//  Contacts
//
//  Created by Lagarde Quentin on 17/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import Foundation

class OldPerson : CustomStringConvertible {
    
    
    static let dateFormatter = initializeFormatter();
    var prenoms: [String];
    var nom: String;
    var dateNaissance :Date;
    
    var autresPrenoms :String {
        get {
            let autresPrenomsArray = self.prenoms[1..<self.prenoms.count];
            return autresPrenomsArray.joined(separator: ", ");
        }
    }
    var patronyme :String {
        get {
            return self.prenoms[0] + " " + self.nom;
        }
    }
    var formattedDate :String {
        get {
            return Personne.dateFormatter.string(from: self.dateNaissance);
        }
    }
    
    weak var delegate :PersonneDelegate?;
    
    init() {
        self.prenoms = [];
        self.nom = "";
        self.dateNaissance = Date();
    }
    
    convenience init(prenom :String) {
        self.init();
        self.prenoms.append(prenom);
    }
    
    var description: String {
        get {
            return "Je suis \(self.prenoms) \(self.nom) et je suis né le \(self.formattedDate)"
        }
    }
    
    func rien(_ value :Int) {
//        var index = 0;
//        for i in 0...value {
//            print("\(i)");
//            index = i;
//        }
//        if(self.delegate != nil) {
////            self.delegate!.sayItsOk(personne: self, withValue: index);
//        }
    }
}


private func initializeFormatter() -> DateFormatter {
    let formatter = DateFormatter();
    formatter.dateStyle = .medium;
    return formatter;
}
