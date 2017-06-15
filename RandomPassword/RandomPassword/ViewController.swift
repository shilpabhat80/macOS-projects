//
//  ViewController.swift
//  RandomPassword
//
//  Created by Shilpa Bhat on 12/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var textField: NSTextField!
    @IBAction func generatePassword(_ sender: NSButton) {
        textField.stringValue = "Generated a password"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

