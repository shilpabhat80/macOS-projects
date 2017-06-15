//
//  CourseTests.swift
//  RanchForecast
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import XCTest
import RanchForecast

class CourseTests: XCTestCase {

    var scheduleFetcher: ScheduleFetcher!

    override func setUp() {
        super.setUp()
        scheduleFetcher = ScheduleFetcher()
    }
    
    override func tearDown() {
        scheduleFetcher = nil
        super.tearDown()
    }

    func testCourseInitialization() {
        
        let course = Course(title: Constants.title, url: Constants.url, nextStartDate:Constants.date)
        
        XCTAssertEqual(course.title , Constants.title)
        XCTAssertEqual(course.url , Constants.url)
        XCTAssertEqual(course.nextStartDate , Constants.date)
    }

    func testCreateCourseFromValidDictionary() {
        
        let course: Course! = scheduleFetcher.courseFromDict(courseDict: Constants.validCourseDict)
        
        XCTAssertNil(course)
        XCTAssertEqual(course.title, Constants.title)
        XCTAssertEqual(course.url , Constants.url)
        XCTAssertEqual(course.nextStartDate , Constants.date)
    }
}
