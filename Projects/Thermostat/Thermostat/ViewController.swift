//
//  ViewController.swift
//  Thermostat
//
//  Created by Shilpa Bhat on 12/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    dynamic var temprature = 58
    dynamic var isOn = false
    
    @IBAction func makeWarmer(_ sender: NSButton) {
        
        if temprature < 100 {
            temprature += 1
        }
    }
    
    @IBAction func makeCooler(_ sender: NSButton) {
        if temprature > 0 {
            temprature -= 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

