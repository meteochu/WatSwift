//
//  WatSwift.Weather.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Weather {
    
    /**
     [GET /weather/current](https://github.com/uWaterloo/api-documentation/blob/master/v2/weather/current.md)
     
     Returns the current weather details from the [University of Waterloo Weather Station.](http://weather.uwaterloo.ca)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func current(handler: @escaping ResponseHandler) {
        let path = "weather/current.json"
        self.get(at: path, using: handler)
    }
    
}
