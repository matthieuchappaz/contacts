//
//  LabelViewController.swift
//  Contacts
//
//  Created by Lagarde Quentin on 18/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var labelValue :String?;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = self.labelValue!;
        
        // Do any additional setup after loading the view.
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
