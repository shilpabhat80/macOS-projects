//
//  MainSplitViewController.swift
//  RanchForecastSplit
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa

class MainSplitViewController: NSSplitViewController, CourseListViewDelegate
{
    
    var masterViewController :CourseListViewController {
        let masterItem = splitViewItems[0] as! NSSplitViewItem
        return masterItem.viewController as! CourseListViewController
    }

    var detailViewController :CourseDetailViewController {
        let detailItem = splitViewItems[1] as! NSSplitViewItem
        return detailItem.viewController as! CourseDetailViewController
    }
    
    let defaultURL = URL(string: "http://www.bignerdranch.com/")!
    override func viewDidLoad() {
        super.viewDidLoad()

        masterViewController.delegate = self
        detailViewController.loadWebView(withURL: defaultURL)
    }

    func courseListViewController(viewController: CourseListViewController, selectedCourse: Course?) -> Void{
        if let course = selectedCourse {
            detailViewController.loadWebView(withURL: course.url)
        }
    }

}



