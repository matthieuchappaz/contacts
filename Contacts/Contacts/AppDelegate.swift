//
//  AppDelegate.swift
//  Contacts
//
//  Created by Lagarde Quentin on 17/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit
import MagicalRecord

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PersonneDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        MagicalRecord.setupCoreDataStack(withAutoMigratingSqliteStoreNamed: "contacts.sqlite");
        
        createPays()
        
        tp1();
        
        print("coucou");
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("applicationWillResignActive");
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("applicationDidEnterBackground");
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("applicationWillEnterForeground");
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("applicationDidBecomeActive");
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("applicationWillTerminate");
    }
    
    func sayItsOk(personne: Personne, withValue number: Int) {
        print("C'est ok pour la valeur \(number) sur \(personne)");
    }
    
    func tp1() {
        //1. imprimer Helloo, World
        print("Hello, World)");
        
        
        let nom  = "Lagarde";
        let prenoms = ["Quentin", "QLAG", "QLA"];
        var dateNaissance :Date?;
        dateNaissance = nil;
        
        
        //1 Initialiser un DateCoponents avec les bonnes valeurs de jour/mois/annee
        var dateNaissanceComponents = DateComponents();
        dateNaissanceComponents.day = 29;
        dateNaissanceComponents.month = 12;
        dateNaissanceComponents.year = 1989;
        
        
        //2. Récupérer une instance du calendrier courant (sur Calendar)
        let calendar = Calendar.current;
        
        
        //3. Instancier la date à partir de ses composantes dans le calendrier récupéré
        dateNaissance = calendar.date(from: dateNaissanceComponents);
        
        var moi = Dictionary<String, String>();
        moi["nom"] = nom;
        
        var fullPrenoms = "";
        for prenom in prenoms {
            fullPrenoms += (prenom + " ");
        }
        moi["prenoms"] = fullPrenoms;
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateStyle = .medium;
        moi["dateNaissance"] = dateFormatter.string(from: dateNaissance!);
        
        
        print("je suis \(moi)");
        
        let moi2 = OldPerson(prenom: "Quentin");
        moi2.nom = "Lagarde";
        moi2.dateNaissance = dateNaissance!;
        print(moi2);
        moi2.delegate = self;
        moi2.rien(3);
        
        
        let moi3 = OldPerson(prenom: "TOTO");
        moi3.nom = "TATA";
        moi3.dateNaissance = dateNaissance!;
        moi3.delegate = self;
        moi3.rien(5);

    }
    
    
    func createPays() {
        if(Pays.mr_countOfEntities() == 0) {
            let france = Pays.mr_createEntity();
            france?.nom = "France";
            france?.gentile = "français";
            
            let belgique = Pays.mr_createEntity();
            belgique?.nom = "Belgique";
            belgique?.gentile = "belge";
            
            let espagne = Pays.mr_createEntity();
            espagne?.nom = "Espagne";
            espagne?.gentile = "espagnol";
            
            let italie = Pays.mr_createEntity();
            italie?.nom = "Italie";
            italie?.gentile = "italien";
            
            let allemagne = Pays.mr_createEntity();
            allemagne?.nom = "Allemagne";
            allemagne?.gentile = "merkelois";
            
            NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait();
        }
    }
    
    

}

