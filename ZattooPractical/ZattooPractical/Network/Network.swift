//
//  Network.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.

import Foundation

///Network Class is bind with server
/// Here you can define `POST`,`GET`,`PUT`.... API type
class Network {
    
    static let shared = Network()
    
    /// Parameters: URL, ModelType, Completion Hanler
    /// Response `Result<T, Error>` where T is Model Which Pass for parsing
    func get<T: Decodable>(_ url:URL, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        print("Request Url: 👉👉👉👉👉", url)
        ///Call API
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else {
                let err = error ?? CustomError.NullData
                print("Response: ☠️☠️☠️☠️☠️", err.localizedDescription)
                completion(.failure(err))
                return
            }
            if let JSONString = String(data: data, encoding: .utf8) {
               print("Response: 👉👉👉👉👉", JSONString)
            }
            completion(data.decode(type: model))
        }
        task.resume()
    }
    
    func post<T: Decodable>(_ request: URLRequest, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        print("Request Url: 👉👉👉👉👉", request.url?.absoluteString ?? "")
        ///Call API
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data else {
                let err = error ?? CustomError.NullData
                print("Response: ☠️☠️☠️☠️☠️", err.localizedDescription)
                completion(.failure(err))
                return
            }
            if let JSONString = String(data: data, encoding: .utf8) {
               print("Response: 👉👉👉👉👉", JSONString)
            }
            completion(data.decode(type: model))
        }
        task.resume()
    }
}
