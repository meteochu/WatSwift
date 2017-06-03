//
//  WatSwift.Directory.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Directory {
    
    /**
     [GET /directory/{user_id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/directory/search.md)
     
     Returns user information for a given WatIAM ID
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func user(forID watiamID: String, handler: @escaping ResponseHandler) {
        let path = "directory/\(watiamID).json"
        self.get(at: path, using: handler)
    }
    
}
