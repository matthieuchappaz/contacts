//
//  PersonneDelegate.swift
//  Contacts
//
//  Created by Lagarde Quentin on 17/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import Foundation

protocol PersonneDelegate : class {
    func sayItsOk(personne: Personne, withValue number :Int);
}
