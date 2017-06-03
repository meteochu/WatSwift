//
//  WatSwift.Feds.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Feds {
    
    /**
     [GET /feds/events](https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/events.md)
     
     Returns a list of the upcoming events from the FEDS database
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func events(handler: @escaping ResponseHandler) {
        let path = "feds/events.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /feds/events/{id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/events_id.md)
     
     Returns a specific event's information given the unique id
     
     - parameters:
     - id: Valid Event ID
     - handler: The JSON handler for the JSON response.
     */
    public static func events(for id: String, handler: @escaping ResponseHandler) {
        let path = "feds/events/\(id).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /feds/locations](https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/locations.md)
     
     Returns a list of all outlets and their operating hour data
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func locations(handler: @escaping ResponseHandler) {
        let path = "feds/locations.json"
        self.get(at: path, using: handler)
    }
    
}
