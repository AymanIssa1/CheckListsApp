//
//  CheckListItem.swift
//  CheckListsApp
//
//  Created by LinuxPlus on 5/1/17.
//  Copyright © 2017 Ayman. All rights reserved.
//

import Foundation

class CheckListItem : NSObject {
    var text:String = ""
    var checked:Bool = false
    
    init(text:String) {
        self.text=text
        self.checked = false
    }
    
    init(text:String,checked:Bool) {
        self.text = text
        self.checked = checked
    }
    
    func toggleCheck(){
        checked = !checked
    }
    
}
