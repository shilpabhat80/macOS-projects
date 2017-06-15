//
//  CourseListViewController.swift
//  RanchForecastSplit
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//


import Cocoa

protocol CourseListViewDelegate: class {
    
    func courseListViewController(viewController: CourseListViewController, selectedCourse: Course?) -> Void
    
}
class CourseListViewController: NSViewController {
   
    let fetcher = ScheduleFetcher()
    dynamic var courses: [Course] = [Course]()
    
    weak var delegate:CourseListViewDelegate? = nil
    
    @IBAction func openClassInfo(_ sender: NSTableView) {
        let selectedRow = sender.selectedRow
        if selectedRow > -1 {
            let course = self.courses[selectedRow]
            delegate?.courseListViewController(viewController: self, selectedCourse: course)
        }
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
