//
//  CheckListDetailItemCell.swift
//  CheckListsApp
//
//  Created by LinuxPlus on 5/1/17.
//  Copyright © 2017 Ayman. All rights reserved.
//

import UIKit

class CheckListDetailItemCell: UITableViewCell {

    @IBOutlet weak var itemName:UILabel!
    @IBOutlet weak var itemChecked:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
