//
//  WatSwift.Parking.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Parking {
    
    public enum MeterType: String {
        
        /**
         [GET /parking/lots/meter](https://github.com/uWaterloo/api-documentation/blob/master/v2/parking/meter.md)
         
         Returns list of metered parking lots across campus
         */
        case meter
        
        /**
         [GET /parking/lots/permits](https://github.com/uWaterloo/api-documentation/blob/master/v2/parking/permits.md)
         
         Returns list of permit based parking lots across campus
         */
        case permit
        
        /**
         [GET /parking/lots/visitor](https://github.com/uWaterloo/api-documentation/blob/master/v2/parking/visitor.md)
         
         Returns list of visitor parking lots across campus
         */
        case visitor
        
        /**
         [GET /parking/lots/shortterm](https://github.com/uWaterloo/api-documentation/blob/master/v2/parking/shortterm.md)
         
         Returns list of short-term parking lots across campus
         */
        case shortterm
        
        /**
         [GET /parking/lots/accessible](https://github.com/uWaterloo/api-documentation/blob/master/v2/parking/accessible.md)
         
         Returns list of accessible parking lots across campus
         */
        case accessible
        
        /**
         [GET /parking/lots/motorcycle](https://github.com/uWaterloo/api-documentation/blob/master/v2/parking/motorcycle.md)
         
         Returns list of motorcycle parking lots across campus
         */
        case motorcycle
    }
    
    /**
     [GET /parking/watpark](https://github.com/uWaterloo/api-documentation/blob/master/v2/parking/watpark.md)
     
     Returns real-time parking counts in select parking lots across campus.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func watpark(handler: @escaping ResponseHandler) {
        let path = "parking/watpark.json"
        self.get(at: path, using: handler)
    }
    
    /**
     Get parking lot information around the Waterloo Campus.
     - parameters:
     - type: The type of parking lot (`.meter`, `.permit`, etc)
     - handler: The JSON handler for the JSON response.
     */
    public static func lot(typed meterType: MeterType, handler: @escaping ResponseHandler) {
        let path = "parking/lots/\(meterType.rawValue).json"
        self.get(at: path, using: handler)
    }
    
}
