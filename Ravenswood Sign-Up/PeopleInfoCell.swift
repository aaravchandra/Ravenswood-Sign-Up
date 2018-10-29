//
//  PeopleInfoCell.swift
//  Ravenswood Sign-Up
//
//  Created by Chandra Gnanasambandam on 10/28/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class PeopleInfoCell: UITableViewCell {

    @IBOutlet weak var PersonName: UILabel!
    
    @IBOutlet weak var PersonEmail: UILabel!
    
    @IBOutlet weak var PersonPhone: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
