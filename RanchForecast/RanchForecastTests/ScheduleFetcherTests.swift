//
//  ScheduleFetcherTests.swift
//  RanchForecast
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import XCTest
import RanchForecast

class ScheduleFetcherTests: XCTestCase {

    var scheduleFetcher: ScheduleFetcher!
  
    override func setUp() {
        super.setUp()

        scheduleFetcher = ScheduleFetcher()
    }
    
    override func tearDown() {
        scheduleFetcher = nil
        super.tearDown()
    }

    func testResultFromValidHTTPResponseAndValidData() {
        
        let result = scheduleFetcher.resultFromData(data: Constants.jsonData,
                                                    response: Constants.okResponse,
                                            error: nil)
        
        switch result {
        case .Success(let courses):
            XCTAssert(courses.count == 1)
            let theCourse = courses[0]

            XCTAssertEqual(theCourse.title, Constants.title)
            XCTAssertEqual(theCourse.url, Constants.url)
            XCTAssertEqual(theCourse.nextStartDate, Constants.date)
        default:
            XCTFail("Result contains Failure, but Success was expected.")
        }
    }}
