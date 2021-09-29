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
        return "http://rest.cameramanager.com/"
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
    
    static func urlPathBuilder(_ endURL: String) -> URL? {
        let stringUrl = baseurl + endURL
        guard let url = URL.init(string: stringUrl) else {
            return nil
        }
        return url
    }
}

///Create Enum for Define Custom Error into Default Error Class
enum EndPoints {
    case login
    case cameras
    case cameraStatus
}

///Return the localized define error for user friend message and understandable message.
extension EndPoints {
    public var url: String {
        switch self {
        case .login:
            return "oauth/token"
        case .cameras:
            return versionRest + "cameras/"
        case .cameraStatus:
            return "/status"
        }
    }
    
    private var versionRest: String {
        return "rest/v2.4/"
    }
}
