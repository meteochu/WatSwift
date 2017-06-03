//
//  WatSwift.Transit.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Transit {
    
    /**
     [GET /transit/grt](https://github.com/uWaterloo/api-documentation/blob/master/v2/transit/grt.md)
     
     Returns list of transit agencies that GRT connects to.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func grtAgencies(handler: @escaping ResponseHandler) {
        let path = "transit/grt.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /transit/grt/stops](https://github.com/uWaterloo/api-documentation/blob/master/v2/transit/agency_stops.md)
     
     Returns list of all GRT bus stops.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func grtStops(handler: @escaping ResponseHandler) {
        let path = "transit/grt/stops.json"
        self.get(at: path, using: handler)
    }
    
}
