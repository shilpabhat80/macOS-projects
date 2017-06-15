//
//  Employee.swift
//  RaiseMan
//
//  Created by Shilpa Bhat on 12/4/17.
//  Copyright © 2017 Shilpa Bhat. All rights reserved.
//

import Foundation

class Employee: NSObject, NSCoding {
    var name: String? = "New Employee"
    var raise:Float = 0.5
    
    override init() {
        super.init()
    }
    
    // MARK: - Coding
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as? String
        raise = aDecoder.decodeFloat(forKey: "raise")
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(raise, forKey: "raise")
    }
    
    func validateRaise(raiseNumberPointer:
        AutoreleasingUnsafeMutablePointer<NSNumber?>,
                          error outError: NSErrorPointer) -> Bool {
        let raiseNumber = raiseNumberPointer.pointee
        if raiseNumber == nil {
            let domain = "UserInputValidationErrorDomain"
            let code = 0
            let userInfo =
                [NSLocalizedDescriptionKey : "An employee's raise must be a number."]
            outError?.pointee = NSError(domain: domain,
                                      code: code,
                                      userInfo: userInfo)
            return false
        } else {
            return true
        }
    }
}
