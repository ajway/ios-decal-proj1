//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Alan Way on 3/1/16.
//  Copyright © 2016 Alan Way. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var toDoItem: ToDoItem?
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject != self.doneButton{
            return
        }
        if !self.textfield.text!.isEmpty{
            self.toDoItem = ToDoItem(name: self.textfield.text!)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

