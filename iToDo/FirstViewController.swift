//
//  FirstViewController.swift
//  iToDo
//
//  Created by Bob on 03/10/2014.
//  Copyright (c) 2014 BallisticSoft. All rights reserved.
//

import UIKit

var myToDoList:[String] = []


class FirstViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var taskTable:UITableView! // outlet for refreshing table data must be linked with ctrl to first view controler otherwise runtime error 
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return myToDoList.count
        }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell.textLabel?.text = myToDoList[indexPath.row]
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
        if var storedToDoItems: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("userInput") {  //we are checking if the app was used before (if there is anything in the NSUSerdefaults)
            
            myToDoList = []     // emptying the myToDo array
            
            for var i = 0; i<storedToDoItems?.count; ++i {               // for all items in array add
                var stringStored = storedToDoItems as Array <String!>    // create new var as string of storedtodoitems
                myToDoList.append(stringStored[i] as NSString)              // add to array
                
            }
            
            
        }

    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) { // ading ability to delete

        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            myToDoList.removeAtIndex(indexPath.row)
            let fixedToDoList = myToDoList                                                          // to do function instead of copy code
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoList, forKey: "userInput")
            NSUserDefaults.standardUserDefaults().synchronize()                                     // this append the persistem stoarege in NSUserdefaults
            taskTable.reloadData() // refresh the table data
            
            
        }
        
        
    }

    
}











