//
//  Request.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation


extension URLRequest {
    
    static func builder(_ url: URL, body: [String:Any]? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        if let body = body {
            request.httpBody = body.formData.data(using: .utf8)
        }
        return request
    }
}

extension Dictionary where Key == String, Value == Any {
    var formData: String {
        var data = [String]()
        for(key, value) in self {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
}
