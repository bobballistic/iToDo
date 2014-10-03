//
//  SecondViewController.swift
//  iToDo
//
//  Created by Bob on 03/10/2014.
//  Copyright (c) 2014 BallisticSoft. All rights reserved.
//  TODO persistent storage, fix landscape view, ad some UI, test

import UIKit

class SecondViewController: UIViewController {
    

    
    @IBOutlet var userInput: UITextField!
    @IBAction func addItemButton(sender: AnyObject) {
       
        myToDoList.append(userInput.text)
        userInput.resignFirstResponder()
        println("\(myToDoList)")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

