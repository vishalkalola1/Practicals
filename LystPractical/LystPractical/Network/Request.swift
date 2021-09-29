//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

enum HttpMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

extension URLRequest {
    
    static func builder(_ url: URL, httpMethod: HttpMethod = .POST, headers: [String:Any] = [:], body: [String:Any]? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        if let body = body {
            request.httpBody = body.formData().data(using: .utf8)
        }
        var requestHeaders = ["content-type":"Application/json",
                              "Accept":"Application/json"] as [String:Any]
        requestHeaders.merge(dict: headers)
        for (key, value) in requestHeaders {
            request.addValue("\(value)", forHTTPHeaderField: key)
        }
        return request
    }
}

extension Dictionary where Key == String, Value == Any {
    func formData(with seperator: String = "&") -> String {
        var data = [String]()
        for(key, value) in self {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: seperator)
    }
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
