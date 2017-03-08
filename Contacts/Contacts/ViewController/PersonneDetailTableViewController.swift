//
//  PersonneDetailTableViewController.swift
//  Contacts
//
//  Created by Matthieu Chappaz on 27/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit

class PersonneDetailTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var imageProfil: UIImageView!
    @IBOutlet weak var personneDescription: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var personne :Personne?
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        //Mettre à jour l'image de la personne
        self.imageProfil.image = UIImage(data: personne?.imageProfil as! Data,scale:1.0)
        
        print(personne!)
        print(self.personne!)
        
        //Mettre à jour le tableau avec le contenu de la personne
        self.tableView.reloadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number = 2
        for prenom in self.personne!.prenoms {
            if !prenom.isEmpty {
                number += 1
            }
        }
        return number
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. Récupérer une cellule prototype via mécanise de recylcage
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! PersonDetailTableViewCell;
        
        //2. Mettre à jour les labels avec les bonnes données
        var labelText: String
        var text: String
        
        switch indexPath.row {
        case 0:
            labelText = "Nom"
            text = self.personne!.nom!
        case 1:
            labelText = "Date de naissance"
            text = self.personne!.formattedDate
        case 2:
            labelText = "Prénom"
            text = self.personne!.prenoms[0]
        case 3:
            labelText = "Prénom 2"
            text = self.personne!.prenoms[1]
        case 4:
            labelText = "Prénom 3"
            text = self.personne!.prenoms[2]
        default:
                labelText = "Fin de ligne"
                text = ""
        }
        
        cell.cellLabel.text = labelText
        cell.contentLabel.text = text
        
        //        cell.patronymeLabel.text = self.personnes[indexPath.row].patronyme;
        //        cell.autresPrenomsLabel.text = self.personnes[indexPath.row].autresPrenoms;
        //        cell.dateNaissanceLabel.text = self.personnes[indexPath.row].formattedDate;
        //        cell.imageView?.image = UIImage(data: self.personnes[indexPath.row].imageProfil as! Data)
        //
        
        //3. Retourner la cellule
        return cell;
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
