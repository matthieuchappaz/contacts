//
//  PersonDetailTableViewCell.swift
//  Contacts
//
//  Created by Matthieu Chappaz on 27/10/2016.
//  Copyright © 2016 Sopra Steria. All rights reserved.
//

import UIKit

class PersonDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
