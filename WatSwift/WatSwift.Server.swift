//
//  WatSwift.Server.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Server {
    
    /**
     [GET /server/time](https://github.com/uWaterloo/api-documentation/blob/master/v2/server/time.md)
     
     Returns time information about the server
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func time(handler: @escaping ResponseHandler) {
        let path = "server/time.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /server/codes](https://github.com/uWaterloo/api-documentation/blob/master/v2/server/codes.md)
     
     Returns a list of all possible API error codes
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func codes(handler: @escaping ResponseHandler) {
        let path = "server/codes.json"
        self.get(at: path, using: handler)
    }
    
}
