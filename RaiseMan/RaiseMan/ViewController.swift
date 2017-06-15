//
//  ViewController.swift
//  RaiseMan
//
//  Created by Shilpa Bhat on 12/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var arrayController: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = FileManager()
        let applicationSupportURLs = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        
        for applicationSupportURL in applicationSupportURLs{
            print("\(applicationSupportURL)")
        }
        // Do any additional setup after loading the view.
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func removeEmployees(_ sender: NSButton) {
        let selectedPeople = arrayController.selectedObjects as! [Employee]
        let removeAlert = NSAlert()
        removeAlert.messageText = "Do you really want to remove \(selectedPeople.count) people?"
        removeAlert.informativeText = "\(selectedPeople.count) people will be removed."
        removeAlert.addButton(withTitle: "Remove")
        removeAlert.addButton(withTitle: "Cancel")
        removeAlert.beginSheetModal(for: view.window!) { (response) in
            switch response {
            case NSAlertFirstButtonReturn:
                    print("Delete selected records")
                    self.arrayController.remove(nil)
            default:
                print("Delete opeartion cancelled")
            }
        }
    }

}

