//
//  WatSwift.PointsOfInterest.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.PointsOfInterest {
    
    public enum PoiType: String {
        /**
         [GET /poi/atms](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/atms.md)
         
         Returns a list of ATMs across campus
         */
        case atms
        
        /**
         [GET /poi/greyhound](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/greyhound.md)
         
         Returns list of Greyhound bus stops across city.
         */
        case greyhound
        
        /**
         [GET /poi/helplines](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/helplines.md)
         
         Returns list of emergency helplines across campus.
         */
        case helplines
        
        
        /**
         [GET /poi/libraries](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/libraries.md)
         
         Returns list of libraries across city.
         */
        case libraries
        
        /**
         [GET /poi/photospheres](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/greyhound.md)
         
         Returns list of photospheres across campus.
         */
        case photospheres
        
        /**
         [GET /poi/defibrillators](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/defibrillators.md)
         
         Returns list of defibrillators across campus.
         */
        case defibrillators
        
        /**
         [GET /poi/constructionsites](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/constructionsites.md)
         
         Returns list of construction sites across campus.
         */
        case constructionSites
        
        /**
         [GET /poi/accessibleentrances](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/accessibleentrances.md)
         
         Returns list of accessible entrances across campus.
         */
        case accessibleEntrances
        
        /**
         [GET /poi/visitorinformation](https://github.com/uWaterloo/api-documentation/blob/master/v2/poi/visitorinformation.md)
         
         Returns list of visitor information centres across campus.
         */
        case visitorInformation
        
        var path: String {
            return self.rawValue.lowercased()
        }
        
    }
    
    /**
     Get the POI around the Waterloo Campus.
     - parameters:
     - type: The type of POI
     - handler: The JSON handler for the JSON response.
     */
    public static func campusPoi(ofType type: PoiType, handler: @escaping ResponseHandler) {
        let path = "poi/\(type.path).json"
        self.get(at: path, using: handler)
    }
    
}
