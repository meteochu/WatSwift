//
//  WatSwift.swift
//  WatSwift
//
//  Created by Andy Liang on 7/18/16.
//  Copyright © 2016 Andy Liang. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

public typealias JSONHandler = (_ meta: JSON, _ data: JSON) -> Void
public typealias FailureHandler = (Error) -> Void

private extension URL {
    static let api: URL = URL(string: "https://api.uwaterloo.ca/v2/")!
}

/**
 *  Before you use WatSwift, you must set the `apiKey` property.
 */
public struct WatSwift {
    
    /// Your `apiKey` is required. If you do not have one, you can obtain one on [Waterloo's API Website](https://api.uwaterloo.ca)
    public static var apiKey: String = ""
    
}

// MARK: WatBase

protocol WatBase {
    func get(at path: String, using handler: JSONHandler)
}

extension WatBase {
    
    internal func get(at path: String, using handler: JSONHandler) {
        let url = URL(string: "\(path)?key=\(WatSwift.apiKey)", relativeTo: .api)!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let json = JSON(data)
            handler(json["meta"], json["data"])
        }
        dataTask.resume()
    }
    
}

public struct API: WatBase {
    
    
    /**
     [GET /api/usage](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/usage.md)
     
     Returns user's api usage statistics
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func usage(handler: JSONHandler) {
        let path = "api/usage.json"
        self.get(at: path, using: handler)
    }
    
    
    /**
     [GET /api/services](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/services.md)
     
     Returns user's api services available to use
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func services(handler: JSONHandler) {
        let path = "api/services.json"
        self.get(at: path, using: handler)
    }
    
    
    /**
     [GET /api/methods](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/methods.md)
     
     Returns user's api methods available to use
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func methods(handler: JSONHandler) {
        let path = "api/methods.json"
        self.get(at: path, using: handler)
    }

    /**
     [GET /api/versions](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/versions.md)
     
     Returns the api version listings
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func versions(handler: JSONHandler) {
        let path = "api/versions.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /api/changelog](https://github.com/uWaterloo/api-documentation/blob/master/v2/api/changelog.md)
     
     Returns a list of changes made to the API
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func changelog(handler: JSONHandler) {
        let path = "api/changelog.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Awards: WatBase {
    
    /**
     [GET /awards/graduate](https://github.com/uWaterloo/api-documentation/blob/master/v2/awards/graduate.md)
     
     Returns a list of all graduate awards, bursaries and scholarships available to students
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func graduate(handler: JSONHandler) {
        let path = "awards/graduate.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /awards/undergraduate](https://github.com/uWaterloo/api-documentation/blob/master/v2/awards/undergraduate.md)
     
     Returns a list of all undergraduate awards, bursaries and scholarships available to students
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func undergraduate(handler: JSONHandler) {
        let path = "awards/undergraduate.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Blogs: WatBase {
    
    /**
     [GET /blogs/{site}](https://github.com/uWaterloo/api-documentation/blob/master/v2/blogs/blogs_site.md)
     
     Returns a list of all blog posts for a given site
     
     - parameters:
        - site: Valid Site ID
        - handler: The JSON handler for the JSON response.
     */
    public func blogPosts(forSite site: String, handler: JSONHandler) {
        let path = "blogs/\(site).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /blogs/{site}/{id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/blogs/blogs_site.md)
     
     Returns a blog posts details for a post id
     
     - parameters:
        - postID: Valid Post ID
        - site: Valid Site ID
        - handler: The JSON handler for the JSON response.
     */
    public func blogPost(forID postID: String, onSite site: String, handler: JSONHandler) {
        let path = "blogs/\(site)/\(postID).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Buildings: WatBase {
    
    /**
     [GET /buildings/list](https://github.com/uWaterloo/api-documentation/blob/master/v2/buildings/list.md)
     
     Returns a list of official building names, codes, numbers, and their lat/long coordinates.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func listAll(handler: JSONHandler) {
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
    public func building(forCode code: String, handler: JSONHandler) {
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
    public func courses(forRoom room: String, inBuilding building: String, handler: JSONHandler) {
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
    public func accesspoints(in building: String, handler: JSONHandler) {
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
    public func vendingMachines(in building: String, handler: JSONHandler) {
        let path = "buildings/\(building)/vendingmachines.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Codes: WatBase {
    
    public enum CodeType: String {
    
        /**
         [GET /cotes/units](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/units.md)
         
         Returns a list of all code lookups and their respective descriptions for organizations.
         */
        case units
        
        /**
         [GET /cotes/terms](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/terms.md)
         
         Returns a list of all code lookups for terms.
         */
        case terms
        
        /**
         [GET /cotes/groups](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/groups.md)
         
         Returns a list of all code lookups for groups.
         */
        case groups
        
        /**
         [GET /cotes/subjects](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/subjects.md)
         
         Returns a list of all code lookups for subjects.
         */
        case subjects
        
        /**
         [GET /cotes/instructions](https://github.com/uWaterloo/api-documentation/blob/master/v2/codes/instructions.md)
         
         Returns a list of instructions.
         */
        case instructions
    
    }
    
    /**
     Lookup codes from the Waterloo OpenData
     - parameters:
        - type: The type of code to lookup (`.units`, `.terms`, etc)
        - handler: The JSON handler for the JSON response.
     */
    public func lookup(type: CodeType, handler: JSONHandler) {
        let path = "codes/\(type.rawValue).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Courses: WatBase {
    
    /**
     [GET /courses](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/courses.md)
     
     Returns a list of all courses (currently and historically) offered from the OpenData database

     - note: This endpoint returns over 6000 courses!
     - parameter handler: The JSON handler for the JSON response.
     */
    public func allCourses(handler: JSONHandler) {
        let path = "courses.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /courses/{subject}](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject.md)
     
     Returns all the courses offered under a given subject
     
     - parameters: 
        - subject: Valid uWaterloo Subject name
        - handler: The JSON handler for the JSON response.
     */
    public func courses(forSubject subject: String, handler: JSONHandler) {
        let path = "courses/\(subject).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /courses/{course_id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/course_id.md)
     
     Returns all available information for a given course
     
     - note: The course_id does not have to be left-padded with zeros
     - parameters:
        - courseID: Valid uWaterloo Course ID
        - handler: The JSON handler for the JSON response.
     */
    public func courseInformation(forID courseID: String, handler: JSONHandler) {
        let path = "courses/\(courseID).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /courses/{course_number}/schedule](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/class_number_schedule.md)
     
     Returns the class schedule for a given course and term
     
     - parameters:
        - classNumber: Valid uWaterloo Course Class Number
        - handler: The JSON handler for the JSON response.
     */
    public func schedule(forClass classNumber: String, handler: JSONHandler) {
        let path = "courses/\(classNumber)/schedule.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /courses/{subject}/{catalog_number}](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number.md)
     
     Returns the class schedule for a given course and term
     
     - parameters:
        - subject: Valid uWaterloo Subject Name
        - catalogNumber: Valid uWaterloo Catalog Number
        - handler: The JSON handler for the JSON response.
     */
    public func courseInformation(subject: String, catalogNumber: String, handler: JSONHandler) {
        let path = "courses/\(subject)/\(catalogNumber).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /courses/{subject}/{catalog_number}/schedule](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number_schedule.md)
     
     Returns the class schedule for a given course and term
     
     - parameters:
        - subject: Valid uWaterloo Subject Name
        - catalogNumber: Valid uWaterloo Catalog Number
        - handler: The JSON handler for the JSON response.
     */
    public func schedule(subject: String, catalogNumber: String, handler: JSONHandler) {
        let path = "courses/\(subject)/\(catalogNumber)/schedule.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /courses/{subject}/{catalog_number}/prerequisite](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number_prerequisites.md)
     
     Returns parsed and raw representation of prerequisites for a given course
     
     - parameters:
        - subject: Valid uWaterloo Subject Name
        - catalogNumber: Valid uWaterloo Catalog Number
        - handler: The JSON handler for the JSON response.
     */
    public func prerequisites(subject: String, catalogNumber: String, handler: JSONHandler) {
        let path = "courses/\(subject)/\(catalogNumber)/prerequisites.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /courses/{subject}/{catalog_number}/examschedule](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number_examschedule.md)
     
     Returns a given course's exam schedule
     
     - parameters:
        - subject: Valid uWaterloo Subject Name
        - catalogNumber: Valid uWaterloo Catalog Number
        - handler: The JSON handler for the JSON response.
     */
    public func examSchedule(subject: String, catalogNumber: String, handler: JSONHandler) {
        let path = "courses/\(subject)/\(catalogNumber)/examschedule.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Events: WatBase {
    
    
    /**
     [GET /events](https://github.com/uWaterloo/api-documentation/blob/master/v2/events/events.md)
     
     Returns a list of the upcoming 21 University of Waterloo events as crawled from all University WCMS sites.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func allEvents(handler: JSONHandler) {
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
    public func events(forSite siteName: String, handler: JSONHandler) {
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
    public func event(forID eventID: String, atSite site: String, handler: JSONHandler) {
        let path = "events/\(site)/\(eventID).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /events/holidays](https://github.com/uWaterloo/api-documentation/blob/master/v2/events/holidays.md)
     
     Returns a list of university holidays starting from 2012
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func holidays(handler: JSONHandler) {
        let path = "events/holidays.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Feds: WatBase {
    
    /**
     [GET /feds/events](https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/events.md)
     
     Returns a list of the upcoming events from the FEDS database
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func events(handler: JSONHandler) {
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
    public func events(for id: String, handler: JSONHandler) {
        let path = "feds/events/\(id).json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /feds/locations](https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/locations.md)
     
     Returns a list of all outlets and their operating hour data
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func locations(handler: JSONHandler) {
        let path = "feds/locations.json"
        self.get(at: path, using: handler)
    }
    
}

public struct FoodServices: WatBase {
    
    /**
     [GET /foodservices/{year}/{week}/menu](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/year_week_menu.md)
     
     Returns the given week and year's food menu.
     
     - parameters:
        - year: The year of the menu you're fetching
        - week: The week of the menu you're fetching
        - handler: The JSON handler for the JSON response.
     */
    public func menu(year: Int, week: Int, handler: JSONHandler) {
        let path = "foodservices/\(year)/\(week)/menu.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/menu](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/menu.md).
     
     Returns the current week's food menu.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func menu(handler: JSONHandler) {
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
    public func notes(year: Int, week: Int, handler: JSONHandler) {
        let path = "foodservices/\(year)/\(week)/notes.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/notes](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/notes.md)
     
     Returns additional notes regarding food served in the current week.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func notes(handler: JSONHandler) {
        let path = "foodservices/notes.json"
        self.get(at: path, using: handler)
    }
    
    
    /**
     [GET /foodservices/diets](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/diets.md)
     
     Returns a list of all diets
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func diets(handler: JSONHandler) {
        let path = "foodservices/diets.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/outlets](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/outlets.md)
     
      Returns a list of all outlets and their unique IDs, names and breakfast/lunch/dinner meal service indicators
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func outlets(handler: JSONHandler) {
        let path = "foodservices/outlets.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/locations](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/locations.md)
     
     Returns a list of all outlets and their operating hour data
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func locations(handler: JSONHandler) {
        let path = "foodservices/locations.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/watcard](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/watcard.md)
     
     Returns a list of all WatCard locations according to Food Services
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func watcard(handler: JSONHandler) {
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
    public func announcements(year: Int, week: Int, handler: JSONHandler) {
        let path = "foodservices/\(year)/\(week)/announcements.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/announcements](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/announcements.md)
     
     Returns additional announcements regarding food served in the current week
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func announcements(handler: JSONHandler) {
        let path = "foodservices/announcements.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /foodservices/products/{product_id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/products_product_id.md)
     
     Returns a product's nutritional information
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func product(for id: String, handler: JSONHandler) {
        let path = "foodservices/products/\(id).json"
        self.get(at: path, using: handler)
    }
    
}

public struct News: WatBase {
    
    /**
     [GET /news](https://github.com/uWaterloo/api-documentation/blob/master/v2/news/news.md)
     
     Returns a list of the freshest (most recently updated) 100 University of Waterloo news items as crawled from all University WCMS sites
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func allNews(handler: JSONHandler) {
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
    public func news(on siteName: String, handler: JSONHandler) {
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
    public func newsItem(forID newsID: String, onSite siteName: String, handler: JSONHandler) {
        let path = "news/\(siteName)/\(newsID).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Opportunities: WatBase {
    
    /**
     [GET /opportunities](https://github.com/uWaterloo/api-documentation/blob/master/v2/opportunities/opportunities.md)
     
     Returns a list of all opportunities available on campus
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func allOpportunities(handler: JSONHandler) {
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
    public func opportunities(on site: String, handler: JSONHandler) {
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
    public func jobDescription(forID jobID: String, fromSite site: String, handler: JSONHandler) {
        let path = "opportunities/\(site)/\(jobID).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Parking: WatBase {
    
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
    public func watpark(handler: JSONHandler) {
        let path = "parking/watpark.json"
        self.get(at: path, using: handler)
    }
    
    /**
     Get parking lot information around the Waterloo Campus.
     - parameters:
        - type: The type of parking lot (`.meter`, `.permit`, etc)
        - handler: The JSON handler for the JSON response.
     */
    public func lot(ofType meterType: MeterType, handler: JSONHandler) {
        let path = "parking/lots/\(meterType.rawValue).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Directory: WatBase {
    
    /**
     [GET /directory/{user_id}](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/courses.md)
     
     Returns user information for a given WatIAM ID
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func user(forID watiamID: String, handler: JSONHandler) {
        let path = "directory/\(watiamID).json"
        self.get(at: path, using: handler)
    }
    
}

public struct PointsOfInterest: WatBase {
    
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
    public func campusPoi(ofType type: PoiType, handler: JSONHandler) {
        let path = "poi/\(type.path).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Resources: WatBase {
    
    public enum ResourceType: String {
        
        /**
         [GET /resources/tutors](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/tutors.md)
         
         Returns a list of all the tutors available to help for a course for a given term
         */
        case tutors
        
        /**
         [GET /resources/printers](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/printers.md)
         
         Returns a list of printers on campus
         */
        case printers
        
        /**
         [GET /resources/infosessions](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/infosessions.md)
         
         Returns a list of campus employer infosessions
         */
        case infosessions
        
        /**
         [GET /resources/goosewatch](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/goosewatch.md)
         
         Returns a list of geese nests during their spring mating season
         */
        case goosewatch
        
        /**
         [GET /resources/sunshinelist](https://github.com/uWaterloo/api-documentation/blob/master/v2/resources/sunshinelist.md)
         
         Returns a list of all UW employees that earn more than $100k/yr
         */
        case sunshinelist
        
    }
    
    /**
     - parameters:
        - type: The type of resource
        - handler: The JSON handler for the JSON response.
     */
    public func resource(ofType type: ResourceType, handler: JSONHandler) {
        let path = "resources/\(type.rawValue).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Server: WatBase {
    
    /**
     [GET /server/time](https://github.com/uWaterloo/api-documentation/blob/master/v2/server/time.md)
     
     Returns time information about the server
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func time(handler: JSONHandler) {
        let path = "server/time.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /server/codes](https://github.com/uWaterloo/api-documentation/blob/master/v2/server/codes.md)
     
     Returns a list of all possible API error codes
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func codes(handler: JSONHandler) {
        let path = "server/codes.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Services: WatBase {
    
    /**
     [GET /services/{site}](https://github.com/uWaterloo/api-documentation/blob/master/v2/services/services_site.md)
     
     Returns a sites associated services.
     
     - parameters:
        - site: Valid uWaterloo site slug
        - handler: The JSON handler for the JSON response.
     */
    public func services(onSite siteName: String, handler: JSONHandler) {
        let path = "services/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
}

public struct Terms: WatBase {
    
    /**
     [GET /terms/list](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/list.md)
     
     Returns the current, previous and next term's id along with a list of terms in the past year and the next year.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func listAll(handler: JSONHandler) {
        let path = "terms/list.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /terms/{term}/courses](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/term_courses.md)
     
     Returns a list of all courses offered for the given term from the opendata database.
     
     - parameters:
        - term: Valid uWaterloo term ID (4 digit representation)
        - handler: The JSON handler for the JSON response.
     */
    public func courses(for term: String, handler: JSONHandler) {
        let path = "terms/\(term)/courses.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /terms/{term}/examschedule](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/term_examschedule.md)
     
     Returns a given term's exam schedule
     
     - parameters:
        - term: Valid uWaterloo term ID (4 digit representation)
        - handler: The JSON handler for the JSON response.
     */
    public func examSchedule(for term: String, handler: JSONHandler) {
        let path = "terms/\(term)/examschedule.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /terms/{term}/{subject}/schedule](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/term_subject_schedule.md)
     
     Returns all class schedule for the given subject for a given term.
     
     - parameters:
        - subject: Valid uWaterloo subject name
        - term: Valid uWaterloo term ID (4 digit representation)
        - handler: The JSON handler for the JSON response.
     */
    public func schedule(forSubject subject: String, inTerm term: String, handler: JSONHandler) {
        let path = "terms/\(term)/\(subject)/schedule.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /terms/{term}/{subject}/{catalog_number}/schedule](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/term_subject_catalog_number_schedule.md)
     
     Returns the class schedule for the given course of a given term.
     
     - parameters:
        - catalogNumber: Course Name
        - subject: Valid uWaterloo subject name
        - term: Valid uWaterloo term ID (4 digit representation)
        - handler: The JSON handler for the JSON response.
     */
    public func schedule(catalogNumber: String, subject: String, term: String, handler: JSONHandler) {
        let path = "terms/\(term)/\(subject)/\(catalogNumber)/schedule.json"
        self.get(at: path, using: handler)
    }
    
    
    /**
     [GET /terms/{term}/enrollment](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/term_enrollment.md)
     
     Returns enrollment numbers for all classes in a term
     
     - parameters:
        - term: Valid uWaterloo term ID (4 digit representation)
        - handler: The JSON handler for the JSON response.
     */
    public func enrollment(forTerm term: String, handler: JSONHandler) {
        let path = "terms/\(term)/enrollment.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /terms/{term}/{subject}/enrollment](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/term_subject_enrollment.md)
     
     Returns enrollment numbers for all courses in a subject for a single term.
     
     - parameters:
        - subject: Valid uWaterloo subject name
        - term: Valid uWaterloo term ID (4 digit representation)
        - handler: The JSON handler for the JSON response.
     */
    public func enrollment(forSubject subject: String, inTerm term: String, handler: JSONHandler) {
        let path = "terms/\(term)/\(subject)/enrollment.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /terms/{term}/infosessions](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/term_infosessions.md)
     
     Returns the schedule for employer information sessions of a given term
     
     - parameters:
        - term: Valid uWaterloo term ID (4 digit representation)
        - handler: The JSON handler for the JSON response.
     */
    public func infoSessions(forTerm term: String, handler: JSONHandler) {
        let path = "terms/\(term)/infosessions.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Transit: WatBase {
    
    /**
     [GET /transit/grt](https://github.com/uWaterloo/api-documentation/blob/master/v2/transit/grt.md)
     
     Returns list of transit agencies that GRT connects to.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func grtAgencies(handler: JSONHandler) {
        let path = "transit/grt.json"
        self.get(at: path, using: handler)
    }
    
    /**
     [GET /transit/grt/stops](https://github.com/uWaterloo/api-documentation/blob/master/v2/transit/agency_stops.md)
     
     Returns list of all GRT bus stops.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func grtStops(handler: JSONHandler) {
        let path = "transit/grt/stops.json"
        self.get(at: path, using: handler)
    }
    
}

public struct Weather: WatBase {
    
    /**
     [GET /weather/current](https://github.com/uWaterloo/api-documentation/blob/master/v2/weather/current.md)
     
     Returns the current weather details from the [University of Waterloo Weather Station.](http://weather.uwaterloo.ca)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func current(handler: JSONHandler) {
        let path = "weather/current.json"
        self.get(at: path, using: handler)
    }
    
}
