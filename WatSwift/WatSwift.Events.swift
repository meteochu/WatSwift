//
//  WatSwift.Events.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Events {
    
    /**
     [GET /events](https://github.com/uWaterloo/api-documentation/blob/master/v2/events/events.md)
     
     Returns a list of the upcoming 21 University of Waterloo events as crawled from all University WCMS sites.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func allEvents(handler: @escaping ResponseHandler) {
        let path = "events.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /events/{site}](https://github.com/uWaterloo/api-documentation/blob/master/v2/events/events_site.md)
     
     Returns a list of the upcoming site events given a site slug
     
     - parameters:
     - siteName: Valid uWaterloo Site Slug from /resources/sites
     - handler: The JSON handler for the JSON response.
     */
    public static func events(forSite siteName: String, handler: @escaping ResponseHandler) {
        let path = "events/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /events/{site}/{id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/events/events_site_id.md)
     
     Returns a specific event's information given a site slug and the unique id
     
     - parameters:
     - eventID: Valid Event ID
     - site: Valid uWaterloo Site Slug from /recourses/sites
     - handler: The JSON handler for the JSON response.
     */
    public static func event(forID eventID: String, atSite site: String, handler: @escaping ResponseHandler) {
        let path = "events/\(site)/\(eventID).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /events/holidays](https://github.com/uWaterloo/api-documentation/blob/master/v2/events/holidays.md)
     
     Returns a list of university holidays starting from 2012
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func holidays(handler: @escaping ResponseHandler) {
        let path = "events/holidays.json"
        self.get(at: path, using: handler)
    }
    
}
