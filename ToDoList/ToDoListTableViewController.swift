//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Alan Way on 3/1/16.
//  Copyright © 2016 Alan Way. All rights reserved.
//


import UIKit



@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController {
    
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        let source: AddToDoViewController = segue.sourceViewController as! AddToDoViewController
        if let item: ToDoItem = source.toDoItem{
            self.toDoItems.addObject(item)
            self.tableView.reloadData()
        }
        
    }
    
    var toDoItems: NSMutableArray = []
    var completedItems: NSMutableArray = []
    var deleteIndexPath: NSIndexPath? = nil
    var timer: NSTimer!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        loadInitialItems()
    }
    
    func loadInitialItems(){
        let item1 = ToDoItem(name:"Finish iOS HW")
        self.toDoItems.addObject(item1)
        let item2 = ToDoItem(name: "Study for CS170")
        self.toDoItems.addObject(item2)
        let item3 = ToDoItem(name: "Go to RSF")
        self.toDoItems.addObject(item3)
        let item4 = ToDoItem(name: "Buy dinner")
        self.toDoItems.addObject(item4)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")!
//        cell.textLabel?.text = toDoItems[indexPath.row] as! String
//        
//        return cell
//    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            deleteIndexPath = indexPath
            let itemToDelete = toDoItems[indexPath.row]
            deleteItem(itemToDelete as! ToDoList.ToDoItem)
        }
    }
    
    func deleteItem(item: ToDoList.ToDoItem) -> Void {
        if let indexPath = deleteIndexPath {
            tableView.beginUpdates()
            
            toDoItems.removeObjectAtIndex(indexPath.row)
            
            // Note that indexPath is wrapped in an array:  [indexPath]
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deleteIndexPath = nil
            
            tableView.endUpdates()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier as String)! as UITableViewCell
        
        let todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        
        cell.textLabel?.text = todoitem.itemName as String
        
        if todoitem.completed{
            cell.accessoryType = .Checkmark
            completedItems.addObject(todoitem)
            //self.timer = NSTimer(timeInterval: 2.0, target: self, selector: deleteItem(todoitem), userInfo: nil, repeats: false)
        }
            
        else{
            cell.accessoryType = .None
            completedItems.removeObject(todoitem)
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "dailyStatsSegue") {
            let svc = segue.destinationViewController as! DailyStatsViewController;
            svc.completedItems = self.completedItems
        }
    }
    
    
}









