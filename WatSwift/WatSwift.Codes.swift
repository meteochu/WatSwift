//
//  WatSwift.Codes.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Codes {
    
    public enum CodeType: String {
        
        /**
         [GET /cotes/units](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/units.md)
         
         Returns a list of all code lookups and their respective descriptions for organizations.
         */
        case units
        
        /**
         [GET /cotes/terms](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/terms.md)
         
         Returns a list of all code lookups for terms.
         */
        case terms
        
        /**
         [GET /cotes/groups](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/groups.md)
         
         Returns a list of all code lookups for groups.
         */
        case groups
        
        /**
         [GET /cotes/subjects](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/subjects.md)
         
         Returns a list of all code lookups for subjects.
         */
        case subjects
        
        /**
         [GET /cotes/instructions](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/instructions.md)
         
         Returns a list of instructions.
         */
        case instructions
        
    }
    
    /**
     Lookup codes from the Waterloo OpenData
     - parameters:
     - type: The type of code to lookup (`.units`, `.terms`, etc)
     - handler: The JSON handler for the JSON response.
     */
    public static func lookup(type: CodeType, handler: @escaping ResponseHandler) {
        let path = "codes/\(type.rawValue).json"
        self.get(at: path, using: handler)
    }
    
}
