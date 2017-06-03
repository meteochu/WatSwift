//
//  Response.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

public struct Response {
    
    public struct Metadata {
        
        public let json: JSON       /// the full json
        public let statusCode: Int  /// http status code
        public let timestamp: Date  /// date of response
        public let message: String  /// message returned in response
        public let methodId: Int    /// the method id
        
        init(metadata: JSON) {
            json = metadata
            statusCode = metadata["status"].integer!
            timestamp = Date(timeIntervalSince1970: metadata["timestamp"].double!)
            message = metadata["message"].string!
            methodId = metadata["method_id"].integer!
        }
        
    }

    /// the metadata of the response
    public let metadata: Metadata
    
    /// the JSON data response 
    public let data: JSON
    
    init(json: JSON) {
        self.metadata = Metadata(metadata: json["meta"])
        self.data = json["data"]
    }
    
}
