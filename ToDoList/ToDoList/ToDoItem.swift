//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Alan Way on 3/1/16.
//  Copyright © 2016 Alan Way. All rights reserved.
//

import Foundation

class ToDoItem: NSObject {
    
    var itemName: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name:String){
        self.itemName = name
    }

}
