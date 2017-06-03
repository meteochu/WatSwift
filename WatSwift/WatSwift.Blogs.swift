//
//  WatSwift.Blogs.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

extension WatSwift.Blogs {
    
    /**
     [GET /blogs/{site}](https://github.com/uWaterloo/api-documentation/blob/master/v2/blogs/blogs_site.md)
     
     Returns a list of all blog posts for a given site
     
     - parameters:
        - site: Valid Site ID
        - handler: The JSON handler for the JSON response.
     */
    public static func blogPosts(forSite site: String, handler: @escaping ResponseHandler) {
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
    public static func blogPost(forID postID: String, onSite site: String, handler: @escaping ResponseHandler) {
        let path = "blogs/\(site)/\(postID).json"
        self.get(at: path, using: handler)
    }
    
}
