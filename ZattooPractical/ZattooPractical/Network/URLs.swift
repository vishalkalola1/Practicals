//
//  Urls.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation


///Define your Urls Base on Query Params
struct URLs {
    
    ///Base URl replace with another in dev and production
    private static var baseurl : String {
        return "https://sandbox.zattoo.com/zapi/"
    }
    
    static func urlBuilder(_ endURL: EndPoints, queryItems: [URLQueryItem] = []) -> URL? {
        guard let url = URL.init(string: baseurl + endURL.url) else {
            return nil
        }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
        }
        if queryItems.count > 0 {
            urlComponents.queryItems = queryItems
        }
        return urlComponents.url
    }
}

///Create Enum for Define Custom Error into Default Error Class
enum EndPoints {
    case StartSession
    case Login
    case Watch
    case Stop
    case CloseSession
}

///Return the localized define error for user friend message and understandable message.
extension EndPoints {
    public var url: String {
        switch self {
        case .StartSession:
            return "/session/hello"
        case .Login:
            return "v2/account/login"
        case .Watch:
            return "/watch"
        case .Stop:
            return "/stop"
        case .CloseSession:
            return "/session/goodbye"
        }
    }
}
