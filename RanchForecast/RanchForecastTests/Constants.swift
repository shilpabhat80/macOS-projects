//
//  Constants.swift
//  RanchForecast
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Foundation

class Constants {
    
    static let urlString = "http://training.bignerdranch.com/classes/test-course"
    
    static let url = URL(string: urlString)!
    
    static let title = "Test Course"
    
    static let dateString = "2014-06-02"
    
    static let dateFormatter:DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    } ()
    
    static let date = dateFormatter.date(from: dateString)!
    
    static let validCourseDict:[String:Any] = [ "courses": [
        "title" : title,
        "url" : urlString,
        "upcoming" : [["start_date" : dateString]]
        ]
    ]
    
    static let okResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
    static let jsonData = try? JSONSerialization.data(withJSONObject: validCourseDict, options:[])
}
