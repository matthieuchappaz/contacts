//
//  PersonTableViewController.swift
//  Contacts
//
//  Created by Lagarde Quentin on 19/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit

class PersonTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let displayperson = { (person :Personne) -> Void in
        print(person)
    }
    
    let q1 = DispatchQueue(label: "ma.q1", qos: .background)
    let q2 = DispatchQueue(label: "ma.q2", qos: .background)
    
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    private var personnes : [Personne] = [];
    
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Personnes"
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        //Mettre à jour le tableaux des personnes avec le contenu de CoreData
        self.personnes = Personne.mr_findAll() as! [Personne];
        
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
        return self.personnes.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. Récupérer une cellule prototype via mécanise de recylcage
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! PersonTableViewCell;

        cell.imageView?.contentMode = UIViewContentMode.scaleAspectFill

        //2. Mettre à jour les labels avec les bonnes données
        cell.patronymeLabel.text = self.personnes[indexPath.row].patronyme;
        cell.autresPrenomsLabel.text = self.personnes[indexPath.row].autresPrenoms;
        cell.dateNaissanceLabel.text = self.personnes[indexPath.row].formattedDate;
        cell.personImg?.image = UIImage(data: self.personnes[indexPath.row].imageProfil as! Data)
//        cell.imageView?.contentMode = UIViewContentMode.center
//        cell.imageView?.contentMode = UIViewContentMode.scaleAspectFit

        //        let aspect = (cell.imageView?.image?.size.width)! / (cell.imageView?.image?.size.height)!
//        
//        let aspectConstraint = NSLayoutConstraint(item: cardMedia, attribute:  NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: cardMedia, attribute: NSLayoutAttribute.Height, multiplier: aspect, constant: 0.0)
        
//        cell.imageView? = UIViewContentMode.cli
//        imageView setContentMode:UIViewContentModeScaleAspectFill];
//        imageView setClipsToBounds:YES

        
        displayperson(self.personnes[indexPath.row])
        
        q1.async {
            for _ in 1..<3 {
                print(self.personnes[indexPath.row].nom ?? "defaultLastName")
            }
        }
        
        q2.async {
            for _ in 1..<3 {
                print(self.personnes[indexPath.row].prenom1 ?? "defaultFirstName")
            }
        }
        
        //3. Retourner la cellule
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addPersonSegue") {
            //On a n'a plus besoin de faire ça depuis la mise en place de CoreData
            //(segue.destination as! AddPersonViewController).personTableViewController = self;
        }
        else if(segue.identifier == "detailPersonSegue") {
            let selectedPerson = self.personnes[(self.tableView.indexPathForSelectedRow!.row)];
            (segue.destination as! PersonneDetailViewController).personne = selectedPerson;
        }
        else if(segue.identifier == "detailPersonTableSegue") {
            let selectedPerson = self.personnes[(self.tableView.indexPathForSelectedRow!.row)];
            print(selectedPerson)
            (segue.destination as! PersonneDetailTableViewController).personne = selectedPerson
        }
    }
    
}
