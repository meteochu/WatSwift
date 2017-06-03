//
//  WatSwift.Opportunities.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Opportunities {
    
    /**
     [GET /opportunities](https://github.com/uWaterloo/api-documentation/blob/master/v2/opportunities/opportunities.md)
     
     Returns a list of all opportunities available on campus
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func allOpportunities(handler: @escaping ResponseHandler) {
        let path = "opportunities.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /opportunities/{site}](https://github.com/uWaterloo/api-documentation/blob/master/v2/opportunities/opportunities_site.md)
     
     Returns a list of the upcoming site opportunities given a site slug
     
     - parameters:
     - site: a valid uWaterloo site slug
     - handler: The JSON handler for the JSON response.
     */
    public static func opportunities(on site: String, handler: @escaping ResponseHandler) {
        let path = "opportunities/\(site).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /opportunities/{site}/{id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/opportunities/opportunities_site_id.md)
     
     Returns the job description for a given opportunity
     
     - parameters:
     - jobID: a Valid Job ID
     - site: a valid uWaterloo site slug
     - handler: The JSON handler for the JSON response.
     */
    public static func jobDescription(forID jobID: String, fromSite site: String, handler: @escaping ResponseHandler) {
        let path = "opportunities/\(site)/\(jobID).json"
        self.get(at: path, using: handler)
    }
    
}
