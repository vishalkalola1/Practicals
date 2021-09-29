//
//  LocationModel.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/3/21.
//

import Foundation


struct LocationModel: Codable {
    let locations: [Location]?
}

struct Location: Codable {
    let name: String?
    let lat: Double
    let long: Double
}
