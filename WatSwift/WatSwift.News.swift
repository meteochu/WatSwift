//
//  WatSwift.News.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.News {
    
    /**
     [GET /news](https://github.com/uWaterloo/api-documentation/blob/master/v2/news/news.md)
     
     Returns a list of the freshest (most recently updated) 100 University of Waterloo news items as crawled from all University WCMS sites
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func allNews(handler: @escaping ResponseHandler) {
        let path = "news.json"
        self.get(at: path, using: handler)
    }
    
    
    /**
     [GET /news/{site}](https://github.com/uWaterloo/api-documentation/blob/master/v2/news/news_site.md)
     
     Returns a list of the upcoming site's news given a site slug
     
     - parameters:
     - site: a valid uWaterloo site slug
     - handler: The JSON handler for the JSON response.
     */
    public static func news(on siteName: String, handler: @escaping ResponseHandler) {
        let path = "news/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /news/{site}/{id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/news/news_site_id.md)
     
     Returns a specific news item's information given a site's slug and id
     
     - parameters:
     - newsID: a Valid news ID
     - site: a valid uWaterloo site slug
     - handler: The JSON handler for the JSON response.
     */
    public static func newsItem(forID newsID: String, onSite siteName: String, handler: @escaping ResponseHandler) {
        let path = "news/\(siteName)/\(newsID).json"
        self.get(at: path, using: handler)
    }
    
}
