//
//  WatSwift.Awards.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Awards {
    
    /**
     [GET /awards/graduate](https://github.com/uWaterloo/api-documentation/blob/master/v2/awards/graduate.md)
     
     Returns a list of all graduate awards, bursaries and scholarships available to students
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func graduate(handler: @escaping ResponseHandler) {
        let path = "awards/graduate.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /awards/undergraduate](https://github.com/uWaterloo/api-documentation/blob/master/v2/awards/undergraduate.md)
     
     Returns a list of all undergraduate awards, bursaries and scholarships available to students
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func undergraduate(handler: @escaping ResponseHandler) {
        let path = "awards/undergraduate.json"
        self.get(at: path, using: handler)
    }
    
}

