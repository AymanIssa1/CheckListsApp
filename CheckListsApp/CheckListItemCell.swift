//
//  CheckListItemCell.swift
//  CheckListsApp
//
//  Created by LinuxPlus on 5/1/17.
//  Copyright © 2017 Ayman. All rights reserved.
//

import UIKit

class CheckListItemCell: UITableViewCell {
    
    @IBOutlet var checkListLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
