//
//  CourseDetailViewController.swift
//  RanchForecastSplit
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Cocoa
import WebKit

class CourseDetailViewController: NSViewController {
    
    @IBOutlet weak var webView: WKWebView!
    

    func loadWebView(withURL url:URL) {
        self.webView.load(URLRequest(url: url))
    }
    
    
}
