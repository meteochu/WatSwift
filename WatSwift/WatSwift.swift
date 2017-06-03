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

public typealias ResponseHandler = (_ response: Response) -> Void

internal extension URL {
    static let api = URL(string: "https://api.uwaterloo.ca/v2/")!
}

/**
 *  Before you use WatSwift, you must set the `apiKey` property.
 */
public struct WatSwift {
    
    /// Your `apiKey` is required. If you do not have one, you can obtain one on [Waterloo's API Website](https://api.uwaterloo.ca)
    public static var apiKey: String = ""
    
    public struct API: WatBase {}
    public struct Awards: WatBase {}
    public struct Blogs: WatBase {}
    public struct Buildings: WatBase {}
    public struct Codes: WatBase {}
    public struct Courses: WatBase {}
    public struct Events: WatBase {}
    public struct Feds: WatBase {}
    public struct FoodServices: WatBase {}
    public struct News: WatBase {}
    public struct Opportunities: WatBase {}
    public struct Parking: WatBase {}
    public struct Directory: WatBase {}
    public struct PointsOfInterest: WatBase {}
    public struct Resources: WatBase {}
    public struct Server: WatBase {}
    public struct Services: WatBase {}
    public struct Terms: WatBase {}
    public struct Transit: WatBase {}
    public struct Weather: WatBase {}
    
}



