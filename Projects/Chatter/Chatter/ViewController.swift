//
//  ViewController.swift
//  Chatter
//
//  Created by Shilpa Bhat on 13/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    dynamic var log: NSAttributedString = NSAttributedString()
    dynamic var message: String = ""
    
    @IBOutlet var textView: NSTextView!
    
    @IBAction func sendMessage(_ sender: Any) {
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

