//
//  Document.swift
//  RaiseMan
//
//  Created by Shilpa Bhat on 12/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var employees = [Employee]()
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        
            return NSKeyedArchiver.archivedData(withRootObject:employees)
    }

    override func read(from data: Data, ofType typeName: String) throws {
        
        employees = NSKeyedUnarchiver.unarchiveObject(with: data) as! [Employee]
    }
    
}

