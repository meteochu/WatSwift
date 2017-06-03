//
//  WatSwift.Resources.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Resources {
    
    public enum ResourceType: String {
        
        /**
         [GET /resources/tutors](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/tutors.md)
         
         Returns a list of all the tutors available to help for a course for a given term
         */
        case tutors
        
        /**
         [GET /resources/printers](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/printers.md)
         
         Returns a list of printers on campus
         */
        case printers
        
        /**
         [GET /resources/infosessions](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/infosessions.md)
         
         Returns a list of campus employer infosessions
         */
        case infosessions
        
        /**
         [GET /resources/goosewatch](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/goosewatch.md)
         
         Returns a list of geese nests during their spring mating season
         */
        case goosewatch
        
        /**
         [GET /resources/sunshinelist](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/sunshinelist.md)
         
         Returns a list of all UW employees that earn more than $100k/yr
         */
        case sunshinelist
        
    }
    
    /**
     - parameters:
     - type: The type of resource
     - handler: The JSON handler for the JSON response.
     */
    public static func resource(ofType type: ResourceType, handler: @escaping ResponseHandler) {
        let path = "resources/\(type.rawValue).json"
        self.get(at: path, using: handler)
    }
    
}
