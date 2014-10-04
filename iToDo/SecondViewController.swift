//
//  SecondViewController.swift
//  iToDo
//
//  Created by Bob on 03/10/2014.
//  Copyright (c) 2014 BallisticSoft. All rights reserved.
//  TODO persistent storage, fix landscape view, ad some UI, test

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    

    
    @IBOutlet var userInput: UITextField!
    @IBAction func addItemButton(sender: AnyObject) {
       
        if userInput.text == "" {
                println("No item entered")
            } else {

            myToDoList.append(userInput.text)
            
            let fixedToDoList = myToDoList
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoList, forKey: "userInput")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            var storedToDoItems: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("userInput") // we are accessing the memory with the storedToDoItems var with is a object tipe
            
            //userInput.resignFirstResponder()
            
            println("\(storedToDoItems)")
            
            userInput.text = ""
                    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldShouldReturn(userInput: UITextField) -> Bool {
        
        userInput.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        self.view.delete(true)
        return true
    }
    
    
    
    
    
}

