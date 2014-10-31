//
//  FirstViewController.swift
//  iToDo
//
//  Created by Bob on 03/10/2014.
//  Copyright (c) 2014 BallisticSoft. All rights reserved.
//

import UIKit

var myToDoList:[String] = [] // First we declare a new empty array of type String


class FirstViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var taskTable:UITableView! // outlet for refreshing table data must be linked with first view controler in MainStoryBoard
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return myToDoList.count // We are setting the number of row equal to the size of the array
        }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell.textLabel?.text = myToDoList[indexPath.row] // Populating the table with the items in our array
            return cell
        }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {   // function to display saved todoitems
        if var storedToDoItems: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("userInput") {  //We are checking if the app was used before (if there is anything in the NSUserdefaults)
            
            myToDoList = []     // emptying the myToDo array (In case there are items in)
            
            for var i = 0; i<storedToDoItems?.count; ++i {               // Looping trough all the items in the array
                var stringStored = storedToDoItems as Array <String!>    // Create new var stringStored (type string) from the storedToDoItems (object)
                myToDoList.append(stringStored[i] as NSString)           // Adding items at index [i] to array
                
            }
            
            
        }

    }
    // Below we are adding the swipe to delete option to the table:
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            myToDoList.removeAtIndex(indexPath.row)                                                 //Removing the item at index.row
            
            let fixedToDoList = myToDoList                                                          //TODO function instead of copy code
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoList, forKey: "userInput")
            NSUserDefaults.standardUserDefaults().synchronize()                                     // Syncronizeing the persisten storage after the removal.
            
            taskTable.reloadData() // refresh the table data
            
            
        }
        
        
    }

    
}











