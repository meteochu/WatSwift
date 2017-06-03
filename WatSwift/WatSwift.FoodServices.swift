//
//  WatSwift.FoodServices.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.FoodServices {
    
    /**
     [GET /foodservices/{year}/{week}/menu](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/year_week_menu.md)
     
     Returns the given week and year's food menu.
     
     - parameters:
     - year: The year of the menu you're fetching
     - week: The week of the menu you're fetching
     - handler: The JSON handler for the JSON response.
     */
    public static func menu(year: Int, week: Int, handler: @escaping ResponseHandler) {
        let path = "foodservices/\(year)/\(week)/menu.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/menu](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/menu.md).
     
     Returns the current week's food menu.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func menu(handler: @escaping ResponseHandler) {
        let path = "foodservices/menu.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/{year}/{week}/notes](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/year_week_notes.md)
     
     Returns additional notes regarding food served in the week specified
     
     - parameters:
     - year: The year of the notes you're fetching
     - week: The week of the notes you're fetching
     - handler: The JSON handler for the JSON response.
     */
    public static func notes(year: Int, week: Int, handler: @escaping ResponseHandler) {
        let path = "foodservices/\(year)/\(week)/notes.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/notes](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/notes.md)
     
     Returns additional notes regarding food served in the current week.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func notes(handler: @escaping ResponseHandler) {
        let path = "foodservices/notes.json"
        self.get(at: path, using: handler)
    }
    
    
    /**
     [GET /foodservices/diets](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/diets.md)
     
     Returns a list of all diets
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func diets(handler: @escaping ResponseHandler) {
        let path = "foodservices/diets.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/outlets](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/outlets.md)
     
     Returns a list of all outlets and their unique IDs, names and breakfast/lunch/dinner meal service indicators
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func outlets(handler: @escaping ResponseHandler) {
        let path = "foodservices/outlets.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/locations](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/locations.md)
     
     Returns a list of all outlets and their operating hour data
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func locations(handler: @escaping ResponseHandler) {
        let path = "foodservices/locations.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/watcard](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/watcard.md)
     
     Returns a list of all WatCard locations according to Food Services
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func watcard(handler: @escaping ResponseHandler) {
        let path = "foodservices/watcard.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/{year}/{week}/announcements](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/year_week_announcements.md)
     
     Returns additional announcements regarding food served in the week specified
     
     - parameters:
     - year: The year of the announcement you're fetching.
     - week: The week of the announcement you're fetching.
     - handler: The JSON handler for the JSON response.
     */
    public static func announcements(year: Int, week: Int, handler: @escaping ResponseHandler) {
        let path = "foodservices/\(year)/\(week)/announcements.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/announcements](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/announcements.md)
     
     Returns additional announcements regarding food served in the current week
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func announcements(handler: @escaping ResponseHandler) {
        let path = "foodservices/announcements.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/products/{product_id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/products_product_id.md)
     
     Returns a product's nutritional information
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func product(for id: String, handler: @escaping ResponseHandler) {
        let path = "foodservices/products/\(id).json"
        self.get(at: path, using: handler)
    }
    
}
