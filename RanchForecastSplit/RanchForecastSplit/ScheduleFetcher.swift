//
//  ScheduleFetcher.swift
//  RanchForecast
//
//  Created by Shilpa Bhat on 15/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Foundation

public class ScheduleFetcher {
    
    let session:URLSession
    
    public init() {
        
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
        
    }
    
    func errorWithCode(code: Int, localizedDescription: String) -> NSError {
        return NSError(domain: "ScheduleFetcher",
                       code: code,
                       userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }
    
    public enum FetchCoursesResult {
        case Success([Course])
        case Failure(Error)
    }
    
    public func fetchCoursesUsingCompletionHandler(completionHandler: @escaping (FetchCoursesResult) -> Void) {
        
        let url = URL(string:"http://bookapi.bignerdranch.com/courses.json")!
        let urlRequest = URLRequest(url: url)
        
        
        let task = session.dataTask(with:urlRequest, completionHandler: {
            (data, response, error) in
            
            let result = self.resultFromData(data: data, response: response, error: error)
            
            OperationQueue.main.addOperation({
                completionHandler(result)
            })
        })
        task.resume()
    }
    
    public func resultFromData(data:Data?, response:URLResponse?, error:Error?) -> FetchCoursesResult {
        
        guard data != nil  else {
            return FetchCoursesResult.Failure(error!)
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            let error = self.errorWithCode(code: 1, localizedDescription: "Unexpected response object.")
            return FetchCoursesResult.Failure(error)
        }
        
        let statusCode = httpResponse.statusCode
        guard statusCode == 200 else {
            let error = self.errorWithCode(code: 1, localizedDescription: "Bad status code \(statusCode)")
            return FetchCoursesResult.Failure(error)
        }
        guard let jsonData = data  else {
            let error = self.errorWithCode(code: 1, localizedDescription: "Data is nil.")
            return FetchCoursesResult.Failure(error)
        }
        
        guard let topLevelDict = try? JSONSerialization.jsonObject(with: jsonData, options:[]) as? [String:Any] else {
            let error = self.errorWithCode(code: 1, localizedDescription: "Can not parse JSON data.")
            return FetchCoursesResult.Failure(error)
        }
        
        guard let courseDicts = topLevelDict?["courses"] as? [Any] else {
            let error = self.errorWithCode(code: 1, localizedDescription: "Could not find key courses.")
            return FetchCoursesResult.Failure(error)
        }
        
        var courses = [Course]()
        for courseDict in courseDicts {
            if let course = self.courseFromDict(courseDict: courseDict as! [String : Any]) {
                courses.append(course)
            }
        }
        return FetchCoursesResult.Success(courses)
    }
    
    let dateFormatter:DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    } ();
    
    public func courseFromDict(courseDict: [String:Any]) -> Course? {
        let title = courseDict["title"] as! String
        
        let urlString = courseDict["url"] as! String
        let url = URL(string: urlString)!
        
        let upcomningArray = courseDict["upcoming"] as! [NSDictionary]
        let upcomingDict = upcomningArray.first!
        let nextDateString = upcomingDict["start_date"] as! String
        let nextDate = dateFormatter.date(from: nextDateString)!
        
        return Course(title: title, url: url, nextStartDate: nextDate)
    }
}
