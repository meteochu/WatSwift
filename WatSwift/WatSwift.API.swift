//
//  WatSwift.API.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.API {
    
    /**
     [GET /api/usage](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/usage.md)
     
     Returns user's api usage statistics
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func usage(handler: @escaping ResponseHandler) {
        let path = "api/usage.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /api/services](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/services.md)
     
     Returns user's api services available to use
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func services(handler: @escaping ResponseHandler) {
        let path = "api/services.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /api/methods](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/methods.md)
     
     Returns user's api methods available to use
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func methods(handler: @escaping ResponseHandler) {
        let path = "api/methods.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /api/versions](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/versions.md)
     
     Returns the api version listings
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func versions(handler: @escaping ResponseHandler) {
        let path = "api/versions.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /api/changelog](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/changelog.md)
     
     Returns a list of changes made to the API
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func changelog(handler: @escaping ResponseHandler) {
        let path = "api/changelog.json"
        self.get(at: path, using: handler)
    }
    
}
