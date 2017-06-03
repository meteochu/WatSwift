//
//  WatSwift.Buildings.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Buildings {
    
    /**
     [GET /buildings/list](https://github.com/uWaterloo/api-documentation/blob/master/v2/buildings/list.md)
     
     Returns a list of official building names, codes, numbers, and their lat/long coordinates.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func listAll(handler: @escaping ResponseHandler) {
        let path = "buildings/list.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /buildings/{builing_code}](https://github.com/uWaterloo/api-documentation/blob/master/v2/buildings/building_acronym.md)
     
     Returns the official building name, its unique number, and its lat/long coordinates given a building code.
     
     - parameters:
     - code: Valid uWaterloo building code.
     - handler: The JSON handler for the JSON response.
     */
    public static func building(forCode code: String, handler: @escaping ResponseHandler) {
        let path = "buildings/\(code).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /buildings/{builing}/{room}/courses](https://github.com/uWaterloo/api-documentation/blob/master/v2/buildings/building_acronym_room_number_courses.md)
     
     Returns the all the courses offered in a given classroom.
     
     - parameters:
     - room: Valid uWaterloo room number.
     - building: Valid uWaterloo building code.
     - handler: The JSON handler for the JSON response.
     */
    public static func courses(forRoom room: String, inBuilding building: String, handler: @escaping ResponseHandler) {
        let path = "buildings/\(building)/\(room)/courses.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /buildings/{builing_code}/accesspoint](https://github.com/uWaterloo/api-documentation/blob/master/v2/buildings/building_acronym_accesspoints.md)
     
     Returns list of all access points in that given building.
     
     - parameters:
     - building: Valid uWaterloo building code.
     - handler: The JSON handler for the JSON response.
     */
    public static func accesspoints(in building: String, handler: @escaping ResponseHandler) {
        let path = "buildings/\(building)/accesspoints.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /buildings/{builing_code}/vendingmachines](https://github.com/uWaterloo/api-documentation/blob/master/v2/buildings/building_acronym_vendingmachines.md)
     
     Returns list of all vending machines in that given building.
     
     - parameters:
     - building: Valid uWaterloo building code.
     - handler: The JSON handler for the JSON response.
     */
    public static func vendingMachines(in building: String, handler: @escaping ResponseHandler) {
        let path = "buildings/\(building)/vendingmachines.json"
        self.get(at: path, using: handler)
    }
    
}
