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
                        userInput.resignFirstResponder()
                        println("\(myToDoList)")
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

