//
//  Network.swift
//  BookingApp
//
//  Created by Vishal on 5/17/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

///Network Class is bind with server
/// Here you can define `POST`,`GET`,`PUT`.... API type
class Network {
    
    
    /// Parameters: URL, ModelType, Completion Hanler
    /// Response `Result<T, Error>` where T is Model Which Pass for parsing
    static func get<T: Decodable>(url:URL, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        ///Call API
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else {
                let err = error ?? CustomError.NullData
                completion(.failure(err))
                return
            }
            completion(data.decode(type: generalType))
        }
        task.resume()
    }
}
