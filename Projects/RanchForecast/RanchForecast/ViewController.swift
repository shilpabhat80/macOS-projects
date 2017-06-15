//
//  ViewController.swift
//  RanchForecast
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    let fetcher = ScheduleFetcher()
    dynamic var courses: [Course] = [Course]()
    
    @IBAction func openClassInfo(_ sender: NSTableView) {
        
        let selectedRow = sender.selectedRow
        let course = self.courses[selectedRow]
        NSWorkspace.shared().open(course.url)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetcher.fetchCoursesUsingCompletionHandler { (
            result) in
            switch result {
            case .Success(let courses):
                    self.courses = courses
                case .Failure(let error):
                    NSAlert(error: error).runModal()
            }
        }
    
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

