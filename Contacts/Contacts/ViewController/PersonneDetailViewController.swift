//
//  PersonneDetailViewController.swift
//  Contacts
//
//  Created by Lagarde Quentin on 18/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit

class PersonneDetailViewController: UIViewController {

    @IBOutlet weak var patronymeLabel: UILabel!
    @IBOutlet weak var dateNaissanceLabel: UILabel!
    @IBOutlet weak var prenom2Label: UILabel!
    @IBOutlet weak var prenom3Label: UILabel!
    @IBOutlet weak var prenomTitleLabel: UILabel!
    
    var personne :Personne?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.patronymeLabel.text = self.personne?.patronyme;
        self.dateNaissanceLabel.text = self.personne?.formattedDate;
        
        
        self.prenom2Label.text = self.personne?.prenom2;
        self.prenom3Label.text = self.personne?.prenom3;


        self.prenomTitleLabel.isHidden = (self.prenom2Label.text?.isEmpty)! && (self.prenom3Label.text?.isEmpty)!;
        
        self.title = "Détail"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
