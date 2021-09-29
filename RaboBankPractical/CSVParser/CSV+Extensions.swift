//
//  CSV+Extensions.swift
//  CSVParser
//
//  Created by Vishal on 7/14/21.
//

import Foundation

extension Array {
    public func toJson() throws -> Data {
        let data = try JSONSerialization.data(withJSONObject: self, options: [])
        return data
    }
}

extension Data {
    public func map<T: Codable>(model: [T].Type) throws -> [T] {
        let decoder = JSONDecoder()
        return try decoder.decode(model, from: self)
    }
}


extension String {
    func split(delimeter: String) -> [String] {
        let headers = self.components(separatedBy: delimeter)
        return headers
    }
}
