//
//  Extensions.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation
import UIKit

///Map Data into Given Models
extension Data {
    func decode<T:Decodable>(type: T.Type) -> Result<T, Error> {
        do {
            let obj = try JSONDecoder().decode(T.self, from: self)
            return .success(obj)
        } catch let error {
            print("Response: ☠️☠️☠️☠️☠️", error.localizedDescription)
            return.failure(error)
        }
    }
}
