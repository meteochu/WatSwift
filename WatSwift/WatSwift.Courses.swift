//
//  WatSwift.Courses.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public extension WatSwift.Courses {
    
    /**
     [GET /courses](https://github.com/uWaterloo/api-documentation/blob/master/v2/courses/courses.md)
     
     Returns a list of all courses (currently and historically) offered from the OpenData database
     
     - note: This endpoint returns over 6000 courses!
     - parameter handler: The JSON handler for the JSON response.
     */
    public static func allCourses(handler: @escaping ResponseHandler) {
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
    public static func courses(forSubject subject: String, handler: @escaping ResponseHandler) {
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
    public static func courseInformation(forID courseID: String, handler: @escaping ResponseHandler) {
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
    public static func schedule(forClass classNumber: String, handler: @escaping ResponseHandler) {
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
    public static func courseInformation(subject: String, catalogNumber: String, handler: @escaping ResponseHandler) {
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
    public static func schedule(subject: String, catalogNumber: String, handler: @escaping ResponseHandler) {
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
    public static func prerequisites(subject: String, catalogNumber: String, handler: @escaping ResponseHandler) {
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
    public static func examSchedule(subject: String, catalogNumber: String, handler: @escaping ResponseHandler) {
        let path = "courses/\(subject)/\(catalogNumber)/examschedule.json"
        self.get(at: path, using: handler)
    }
    
}
