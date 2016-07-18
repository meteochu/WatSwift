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

internal extension URL {
    static let api: URL = URL(string: "https://api.uwaterloo.ca/v2/")!
}

public typealias JSONHandler = (meta: JSON, data: JSON) -> Void
public typealias FailureHandler = (error: NSError) -> Void

/**
 *  Before you use WatSwift, you must set the `apiKey` property.
 */
public struct WatSwift {
    
    /// Your `apiKey` is required. If you do not have one, you can obtain one on [Waterloo's API Website](https://api.uwaterloo.ca)
    public static var apiKey: String = ""
    
    public static let foodServices: FoodServices = FoodServices()
    public static let feds: Feds = Feds()
    public static let courses: Courses = Courses()
    public static let awards: Awards = Awards()
    public static let events: Events = Events()
    public static let blogs: Blogs = Blogs()
    public static let news: News = News()
    public static let opportunities: Opportunities = Opportunities()
    public static let services: Services = Services()
    public static let weather: Weather = Weather()
    public static let terms: Terms = Terms()
    public static let resources: Resources = Resources()
    public static let codes: Codes = Codes()
    public static let buildings: Buildings = Buildings()
    public static let poi: PointsOfInterest = PointsOfInterest()
    public static let parking: Parking = Parking()
    public static let transit: Transit = Transit()
    public static let directory: Directory = Directory()
    public static let api: API = API()
    public static let server: Server = Server()
    
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
            handler(meta: json["meta"], data: json["data"])
        }
        dataTask.resume()
    }
    
}

// - MARK: API

public struct API: WatBase {
    
    public func usage(handler: JSONHandler) {
        let path = "api/usage.json"
        self.get(at: path, using: handler)
    }
    
    public func services(handler: JSONHandler) {
        let path = "api/services.json"
        self.get(at: path, using: handler)
    }
    
    public func methods(handler: JSONHandler) {
        let path = "api/methods.json"
        self.get(at: path, using: handler)
    }
    
    public func versions(handler: JSONHandler) {
        let path = "api/versions.json"
        self.get(at: path, using: handler)
    }
    
    public func changelog(handler: JSONHandler) {
        let path = "api/changelog.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Awards

public struct Awards: WatBase {
    
    /**
     `GET /awards/graduate.json`
     
     Returns a list of all graduate awards, bursaries and scholarships available to students
     
     - SeeAlso:
     [/awards/graduate]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/awards/graduate.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func graduate(handler: JSONHandler) {
        let path = "awards/graduate.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /awards/undergraduate.json`
     
     Returns a list of all undergraduate awards, bursaries and scholarships available to students
     
     - SeeAlso:
     [/awards/undergraduate]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/awards/undergraduate.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func undergraduate(handler: JSONHandler) {
        let path = "awards/undergraduate.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Blogs

public struct Blogs: WatBase {
    
    /// This method returns a list of all blog posts for a given site
    public func blog(forSite siteName: String, handler: JSONHandler) {
        let path = "blogs/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a blog posts details for a post id
    public func blogPost(forID postID: String, onSite siteName: String, handler: JSONHandler) {
        let path = "blogs/\(siteName)/\(postID).json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Building

public struct Buildings: WatBase {
    
    public func listAll(handler: JSONHandler) {
        let path = "buildings/list.json"
        self.get(at: path, using: handler)
    }
    
    public func building(forCode code: String, handler: JSONHandler) {
        let path = "buildings/\(code).json"
        self.get(at: path, using: handler)
    }
    
    public func courses(forRoom room: String, inBuilding building: String, handler: JSONHandler) {
        let path = "buildings/\(building)/\(room)/courses.json"
        self.get(at: path, using: handler)
    }
    
    public func accesspoints(in building: String, handler: JSONHandler) {
        let path = "buildings/\(building)/accesspoints.json"
        self.get(at: path, using: handler)
    }
    
    public func vendingMachines(in building: String, handler: JSONHandler) {
        let path = "buildings/\(building)/vendingmachines.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Codes

public struct Codes: WatBase {
    
    /// This method returns a list of all code lookups and their respective descriptions for organizations.
    public func units(handler: JSONHandler) {
        let path = "codes/units.json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a list of all code lookups for terms.
    public func terms(handler: JSONHandler) {
        let path = "codes/terms.json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a list of all code lookups for groups.
    public func groups(handler: JSONHandler) {
        let path = "codes/groups.json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a list of all code lookups for subjects.
    public func subjects(handler: JSONHandler) {
        let path = "codes/subjects.json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a list of Instructions.
    public func instructions(handler: JSONHandler) {
        let path = "codes/instructions.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Course

public struct Courses: WatBase {
    
    /**
     `GET /courses.json`
     
     Returns a list of all courses (currently and historically) offered from the OpenData database
     
     - note: This endpoint returns over 6000 courses!
     - SeeAlso:
     [/courses.json]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/courses.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func allCoures(handler: JSONHandler) {
        let path = "courses.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /courses/{subject}.json`
     
     Returns all the courses offered under a given subject
     
     - SeeAlso:
     [/courses/{subject}]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject.md)
     
     - parameters: 
        - subject: Valid uWaterloo Subject name
        - handler: The JSON handler for the JSON response.
     */
    public func courses(forSubject subject: String, handler: JSONHandler) {
        let path = "courses/\(subject).json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /courses/{course_id}.json`
     
     Returns all available information for a given course
     
     - note: The course_id does not have to be left-padded with zeros
     - SeeAlso:
     [/courses/{course_id}]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/course_id.md)
     
     - parameters:
        - courseID: Valid uWaterloo Course ID
        - handler: The JSON handler for the JSON response.
     */
    public func courseInformation(forID courseID: String, handler: JSONHandler) {
        let path = "courses/\(courseID).json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /courses/{course_number}/schedule.json`
     
     Returns the class schedule for a given course and term
     
     - SeeAlso:
     [/courses/{course_number}/schedule]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/class_number_schedule.md)
     
     - parameters:
        - classNumber: Valid uWaterloo Course Class Number
        - handler: The JSON handler for the JSON response.
     */
    public func schedule(forClass classNumber: String, handler: JSONHandler) {
        let path = "courses/\(classNumber)/schedule.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /courses/{subject}/{catalog_number}.json`
     
     Returns the class schedule for a given course and term
     
     - SeeAlso:
     [/courses/{subject}/{catalog_number}]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number.md)
     
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
     `GET /courses/{subject}/{catalog_number}/schedule.json`
     
     Returns the class schedule for a given course and term
     
     - SeeAlso:
     [/courses/{subject}/{catalog_number}/schedule]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number_schedule.md)
     
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
     `GET /courses/{subject}/{catalog_number}/prerequisite.json`
     
     Returns parsed and raw representation of prerequisites for a given course
     
     - SeeAlso:
     [/courses/{subject}/{catalog_number}/prerequisite]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number_prerequisites.md)
     
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
     `GET /courses/{subject}/{catalog_number}/examschedule.json`
     
     Returns a given course's exam schedule
     
     - SeeAlso:
     [/courses/{subject}/{catalog_number}/examschedule]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/subject_catalog_number_examschedule.md)
     
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

// - MARK: Events

public struct Events: WatBase {
    
    public func events(handler: JSONHandler) {
        let path = "events.json"
        self.get(at: path, using: handler)
    }
    
    public func events(forSite siteName: String, handler: JSONHandler) {
        let path = "events/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
    public func event(forID eventID: String, atSite site: String, handler: JSONHandler) {
        let path = "events/\(site)/\(eventID).json"
        self.get(at: path, using: handler)
    }
    
    public func holidays(handler: JSONHandler) {
        let path = "events/holidays.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Feds

public struct Feds: WatBase {
    
    /**
     `GET /feds/events.json`
     
     Returns a list of the upcoming events from the FEDS database
     
     - SeeAlso:
     [/feds/events]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/events.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func events(handler: JSONHandler) {
        let path = "feds/events.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /feds/events/{id}.json`
     
     Returns a specific event's information given the unique id
     
     - SeeAlso:
     [/feds/events]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/events_id.md)
     
     - parameters: 
        - id: Valid Event ID
        - handler: The JSON handler for the JSON response.
     */
    public func events(for id: String, handler: JSONHandler) {
        let path = "feds/events/\(id).json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /feds/locations.json`
     
     Returns a list of all outlets and their operating hour data
     
     - SeeAlso:
     [/feds/locations]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/feds/locations.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func locations(handler: JSONHandler) {
        let path = "feds/locations.json"
        self.get(at: path, using: handler)
    }
    
}


// - MARK: Food Services

public struct FoodServices: WatBase {
    
    /**
     `GET /foodservices/{year}/{week}/menu.json`
     
     Returns the given week and year's food menu.
     
     - SeeAlso: [/foodservices/{year}/{week}/menu]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/year_week_menu.md)
     
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
     `GET /foodservices/menu.json`
     
     Returns the current week's food menu.
     
     - SeeAlso: 
     [/foodservices/menu]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/menu.md).
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func menu(handler: JSONHandler) {
        let path = "foodservices/menu.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /foodservices/{year}/{week}/notes.json`
     
     Returns additional notes regarding food served in the week specified
     
     - SeeAlso: [/foodservices/{year}/{week}/notes]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/year_week_notes.md)
     
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
     `GET /foodservices/notes.json`
     
     Returns additional notes regarding food served in the current week.
     
     - SeeAlso:
     [/foodservices/menu]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/notes.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func notes(handler: JSONHandler) {
        let path = "foodservices/notes.json"
        self.get(at: path, using: handler)
    }
    
    
    /**
     `GET /foodservices/diets.json`
     
     Returns a list of all diets
     
     - SeeAlso:
     [/foodservices/diets]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/diets.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func diets(handler: JSONHandler) {
        let path = "foodservices/diets.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /foodservices/outlets.json`
     
      Returns a list of all outlets and their unique IDs, names and breakfast/lunch/dinner meal service indicators
     
     - SeeAlso:
     [/foodservices/outlets]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/outlets.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func outlets(handler: JSONHandler) {
        let path = "foodservices/outlets.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /foodservices/locations.json`
     
     Returns a list of all outlets and their operating hour data
     
     - SeeAlso:
     [/foodservices/locations]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/locations.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func locations(handler: JSONHandler) {
        let path = "foodservices/locations.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /foodservices/watcard.json`
     
     Returns a list of all WatCard locations according to Food Services
     
     - SeeAlso:
     [/foodservices/watcard]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/watcard.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func watcard(handler: JSONHandler) {
        let path = "foodservices/watcard.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /foodservices/{year}/{week}/announcements.json`
     
     Returns additional announcements regarding food served in the week specified
     
     - SeeAlso: [/foodservices/{year}/{week}/announcements]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/year_week_menu.md)
     
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
     `GET /foodservices/announcements.json`
     
     Returns additional announcements regarding food served in the current week
     
     - SeeAlso:
     [/foodservices/announcements]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/announcements.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func announcements(handler: JSONHandler) {
        let path = "foodservices/announcements.json"
        self.get(at: path, using: handler)
    }
    
    /**
     `GET /foodservices/products/{product_id}.json`
     
     Returns a product's nutritional information
     
     - SeeAlso:
     [/foodservices/products/{product_id}]
     (https://github.com/uWaterloo/api-documentation/blob/master/v2/foodservices/products_product_id.md)
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public func product(for id: String, handler: JSONHandler) {
        let path = "foodservices/products/\(id).json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: News

public struct News: WatBase {
    
    /// This method returns a list of the freshest (most recently updated) 100 University of Waterloo news items as crawled from all University WCMS sites
    public func allNews(handler: JSONHandler) {
        let path = "news.json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a list of the upcoming site's news given a site slug
    public func news(on siteName: String, handler: JSONHandler) {
        let path = "news/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a specific news item's information given a site's slug and id
    public func newsItem(forID newsID: String, onSite siteName: String, handler: JSONHandler) {
        let path = "news/\(siteName)/\(newsID).json"
        self.get(at: path, using: handler)
    }
    
}


// - MARK: Opportunities

public struct Opportunities: WatBase {
    
    /// This method returns a list of all opportunities available on campus
    public func allOpportunities(handler: JSONHandler) {
        let path = "opportunities.json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a list of all opportunities available on campus
    public func opportunities(on siteName: String, handler: JSONHandler) {
        let path = "opportunities/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns a the job description for a given opportunity
    public func jobDescription(forID jobID: String, onSite siteName: String, handler: JSONHandler) {
        let path = "opportunities/\(siteName)/\(jobID).json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Parking

public struct Parking: WatBase {
    
    public enum MeterType: String {
        case meter
        case permit
        case visitor
        case shortterm
        case accessible
        case motorcycle
        
        var path: String {
            return "parking/lots/\(self.rawValue).json"
        }
    }
    
    public func watpark(handler: JSONHandler) {
        let path = "parking/watpark.json"
        self.get(at: path, using: handler)
    }
    
    public func lots(type meterType: MeterType, handler: JSONHandler) {
        let path = meterType.path
        self.get(at: path, using: handler)
    }
    
}

// - MARK: People Directory

public struct Directory: WatBase {
    
    public func user(forID userID: String, handler: JSONHandler) {
        let path = "directory/\(userID).json"
        self.get(at: path, using: handler)
    }
    
}


// - MARK: Points of Interest

public struct PointsOfInterest: WatBase {
    
    public func atms(handler: JSONHandler) {
        let path = "poi/atms.json"
        self.get(at: path, using: handler)
    }
    
    public func greyhound(handler: JSONHandler) {
        let path = "poi/greyhound.json"
        self.get(at: path, using: handler)
    }
    
    public func helplines(handler: JSONHandler) {
        let path = "poi/helplines.json"
        self.get(at: path, using: handler)
    }
    
    public func photospheres(handler: JSONHandler) {
        let path = "poi/photospheres.json"
        self.get(at: path, using: handler)
    }
    
    public func defibrillators(handler: JSONHandler) {
        let path = "poi/defibrillators.json"
        self.get(at: path, using: handler)
    }
    
    public func constructionSites(handler: JSONHandler) {
        let path = "poi/constructionsites.json"
        self.get(at: path, using: handler)
    }
    
    public func accessibleEntraces(handler: JSONHandler) {
        let path = "poi/accessibleEntraces.json"
        self.get(at: path, using: handler)
    }
    
    public func visitorInformation(handler: JSONHandler) {
        let path = "poi/visitorinformation.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Resources

public struct Resources: WatBase {
    
    public func tutors(handler: JSONHandler) {
        let path = "resources/tutors.json"
        self.get(at: path, using: handler)
    }
    
    public func printers(handler: JSONHandler) {
        let path = "resources/printers.json"
        self.get(at: path, using: handler)
    }
    
    public func infoSessions(handler: JSONHandler) {
        let path = "resources/infosessions.json"
        self.get(at: path, using: handler)
    }
    
    public func gooseWatch(handler: JSONHandler) {
        let path = "resources/goosewatch.json"
        self.get(at: path, using: handler)
    }
    
    public func sunshineList(handler: JSONHandler) {
        let path = "resources/sunshinelist.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Server

public struct Server: WatBase {
    
    public func time(handler: JSONHandler) {
        let path = "server/time.json"
        self.get(at: path, using: handler)
    }
    
    public func codes(handler: JSONHandler) {
        let path = "server/codes.json"
        self.get(at: path, using: handler)
    }
    
}


// - MARK: Services

public struct Services: WatBase {
    
    /// This method returns a sites associated services.
    public func services(onSite siteName: String, handler: JSONHandler) {
        let path = "services/\(siteName).json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Terms

public struct Terms: WatBase {
    
    public func listAll(handler: JSONHandler) {
        let path = "terms/list.json"
        self.get(at: path, using: handler)
    }
    
    public func courses(for term: String, handler: JSONHandler) {
        let path = "terms/\(term)/courses.json"
        self.get(at: path, using: handler)
    }
    
    public func examSchedule(for term: String, handler: JSONHandler) {
        let path = "terms/\(term)/examschedule.json"
        self.get(at: path, using: handler)
    }
    
    public func schedule(forSubject subject: String, inTerm term: String, handler: JSONHandler) {
        let path = "terms/\(term)/\(subject)/schedule.json"
        self.get(at: path, using: handler)
    }
    
    public func schedule(catalogNumber: String, forSubject subject: String, inTerm term: String, handler: JSONHandler) {
        let path = "terms/\(term)/\(subject)/\(catalogNumber)/schedule.json"
        self.get(at: path, using: handler)
    }
    
    public func enrollment(for term: String, handler: JSONHandler) {
        let path = "terms/\(term)/enrollment.json"
        self.get(at: path, using: handler)
    }
    
    public func enrollment(forSubject subject: String, inTerm term: String, handler: JSONHandler) {
        let path = "terms/\(term)/\(subject)/enrollment.json"
        self.get(at: path, using: handler)
    }
    
    public func infosessions(for term: String, handler: JSONHandler) {
        let path = "terms/\(term)/infosessions.json"
        self.get(at: path, using: handler)
    }
    
}

// - MARK: Transit

public struct Transit: WatBase {
    
    /// This method returns list of transit agencies that GRT connects to
    public func grtAgencies(handler: JSONHandler) {
        let path = "transit/grt.json"
        self.get(at: path, using: handler)
    }
    
    /// This method returns list of all GRT bus stops
    public func grtStops(handler: JSONHandler) {
        let path = "transit/grt/stops.json"
        self.get(at: path, using: handler)
    }
    
}


// - MARK: Weather

public struct Weather: WatBase {
    
    /// This method returns the current weather details from the [University of Waterloo Weather Station.](http://weather.uwaterloo.ca)
    public func current(handler: JSONHandler) {
        let path = "weather/current.json"
        self.get(at: path, using: handler)
    }
    
}
    
