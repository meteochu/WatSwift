//
//  WatBase.swift
//  WatSwift
//
//  Created by Andy Liang on 2017-06-03.
//  Copyright © 2017 Andy Liang. All rights reserved.
//

import Foundation

internal protocol WatBase {
    static func get(at path: String, using handler: @escaping ResponseHandler)
}

internal extension WatBase {
    
    static func get(at path: String, using handler: @escaping ResponseHandler) {
        assert(!WatSwift.apiKey.isEmpty, "You must set the API Key via `WatSwift.apiKey`")
        let url = URL(string: "\(path)?key=\(WatSwift.apiKey)", relativeTo: .api)!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let dataTask = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let response = Response(json: JSON(data))
            handler(response)
        }
        dataTask.resume()
    }
    
}
