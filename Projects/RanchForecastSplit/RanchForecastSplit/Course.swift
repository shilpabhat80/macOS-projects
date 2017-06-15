//
//  Course.swift
//  RanchForecast
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Foundation

public class Course: NSObject {
    
    public let title: String
    public let url: URL
    public let nextStartDate: Date
    
    public init(title: String, url: URL, nextStartDate: Date) {
        self.title = title
        self.url = url
        self.nextStartDate = nextStartDate
        
        super.init()
    }
}
