//
//  Urls.swift
//  BookingApp
//
//  Created by Vishal on 5/18/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation


///Define your Urls Base on Query Params
struct URls {
    
    ///Base URl replace with another in dev and production
    private var baseurl : URL {
        return URL.init(string: "https://randomuser.me/api/")!
    }
    
    ///QueryParams Items
    private var queryItems: [URLQueryItem]?
    
    ///Add `URLQueryItem` into Varidic constructor
    init(_ queryItems: URLQueryItem...) {
        self.queryItems = queryItems
    }
    
    ///Join Query Params into Base URl if URl dont have QueryParams dont use this methods
    func geturl() -> URL? {
        guard var urlComponents = URLComponents(url: self.baseurl, resolvingAgainstBaseURL: true) else {
            return nil
        }
        urlComponents.queryItems = self.queryItems
        return urlComponents.url
    }
}
