//
//  WatSwift.Services.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Services {
    
    /**
     [GET /services/{site}](https://github.com/uWaterloo/api-documentation/blob/master/v2/services/services_site.md)
     
     Returns a sites associated services.
     
     - parameters:
     - site: Valid uWaterloo site slug
     - handler: The JSON handler for the JSON response.
     */
    public static func services(onSite siteName: String, handler: @escaping ResponseHandler) {
        let path = "services/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
}
