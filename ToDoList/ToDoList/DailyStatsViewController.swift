//
//  DailyStatsViewController.swift
//  ToDoList
//
//  Created by Alan Way on 3/1/16.
//  Copyright © 2016 Alan Way. All rights reserved.
//

import UIKit

class DailyStatsViewController: UITableViewController {
    
    var completedItems: NSMutableArray = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    }
    
//    func loadInitialItems(){
////        let item1 = ToDoItem(name:"Finish iOS HW")
////        self.toDoItems.addObject(item1)
//        
//        for item in completedItems:
//            
//    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.completedItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "dailyStatsPrototypeCell"
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier as String)! as UITableViewCell
        
        
        let completeditem: ToDoItem = self.completedItems.objectAtIndex(indexPath.row) as! ToDoItem
        
        cell.textLabel?.text = completeditem.itemName as String
        
        return cell
    }

}
