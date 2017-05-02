//
//  CheckList.swift
//  CheckListsApp
//
//  Created by LinuxPlus on 5/1/17.
//  Copyright © 2017 Ayman. All rights reserved.
//

import Foundation

class CheckList : NSObject {
    var checkListName : String = ""
    var checkListItems: [CheckListItem] = []
    
    init(checkListName:String) {
        self.checkListName = checkListName
        checkListItems = []
    }


    
}
