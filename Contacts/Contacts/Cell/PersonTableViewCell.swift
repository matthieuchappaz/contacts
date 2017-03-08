//
//  PersonTableViewCell.swift
//  Contacts
//
//  Created by Lagarde Quentin on 19/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var patronymeLabel: UILabel!
    @IBOutlet weak var autresPrenomsLabel: UILabel!
    @IBOutlet weak var dateNaissanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
