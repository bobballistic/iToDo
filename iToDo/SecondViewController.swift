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
       
        if userInput.text == "" {                       // This if - else statement was created so we don't add a empty string value to our array in case the user
                println("No item entered")              // doesn't type nothing in the textBox and just presses the button
            } else {                                    // If nothing is enterd we will just receive a message in the console, nothing else will happen.

            myToDoList.append(userInput.text)           // Adding the user input to array
            
            let fixedToDoList = myToDoList                                                          // Implementing the persistent storage.
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoList, forKey: "userInput")     // The constant fixedToDoList containing myToDolist is sent to
            NSUserDefaults.standardUserDefaults().synchronize()                                     // memory
            
            var storedToDoItems: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("userInput") // We are accessing the stored values with the
                                                                                                              // storedToDoItems var
            //userInput.resignFirstResponder() // This is in case we want the keyboard to disapear when user pressed button
            
            println("\(storedToDoItems)")
            
            userInput.text = "" // This sets the userInput text field to empty
                    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldShouldReturn(userInput: UITextField) -> Bool { // Resigning keyboard when user presses return
        
        userInput.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {  // Resigning keyboard when user touches screen
        self.view.endEditing(true)
    }
    
    //func textFieldShouldClear(textField: UITextField) -> Bool {
    //    self.view.delete(true)
    //    return true
    //}
    
    
    
    
    
}

