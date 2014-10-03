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
    
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return myToDoList.count
        }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
            cell.textLabel?.text = myToDoList[0]
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


}

