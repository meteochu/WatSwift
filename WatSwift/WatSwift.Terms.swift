//
//  WatSwift.Terms.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Terms {
    
    /**
     [GET /terms/list](https://github.com/uWaterloo/api-documentation/blob/master/v2/terms/list.md)
     
     Returns the current, previous and next term's id along with a list of terms in the past year and the next year.
     
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func listAll(handler: @escaping ResponseHandler) {
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
    public static func courses(for term: String, handler: @escaping ResponseHandler) {
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
    public static func examSchedule(for term: String, handler: @escaping ResponseHandler) {
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
    public static func schedule(forSubject subject: String, inTerm term: String, handler: @escaping ResponseHandler) {
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
    public static func schedule(catalogNumber: String, subject: String, term: String, handler: @escaping ResponseHandler) {
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
    public static func enrollment(forTerm term: String, handler: @escaping ResponseHandler) {
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
    public static func enrollment(forSubject subject: String, inTerm term: String, handler: @escaping ResponseHandler) {
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
    public static func infoSessions(forTerm term: String, handler: @escaping ResponseHandler) {
        let path = "terms/\(term)/infosessions.json"
        self.get(at: path, using: handler)
    }
    
}
