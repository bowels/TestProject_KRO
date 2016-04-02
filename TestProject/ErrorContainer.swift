//
//  TestProjectErrors.swift
//  TestProject
//
//  Created by Roman Kovalchuk on 4/2/16.
//  Copyright © 2016 iceHead. All rights reserved.
//

import Foundation

class ErrorContainer {
    
    /**
     Test Project Server Errors
     */
    
    class var ServerNotFound: NSError {
        return NSError(domain: "Test Project", code: 404,
                       userInfo: [NSLocalizedDescriptionKey : "Server Not Found"])
    }
    
    /**
       Test Project Client Errors
    */
    
    class var CharactersLess: NSError {
        return NSError(domain: "Test Project", code: 100,
                       userInfo: [NSLocalizedDescriptionKey : "Username must be more than 4 characters lenght"])
    }
}
