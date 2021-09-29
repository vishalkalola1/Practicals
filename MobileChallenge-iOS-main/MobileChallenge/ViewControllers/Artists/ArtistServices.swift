//
//  ApoloAPI.swift
//  MobileChallenge
//
//  Created by Vishal on 6/10/21.
//

import Foundation
import Apollo


protocol ArtistServicesProtocol: AnyObject {
    func getArtists<T: Decodable>(byName name: String, after: String?, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class ArtistServices: ArtistServicesProtocol {
    
    static let shared = ArtistServices()
    let apoloservice: ApolloService
    
    private init(){
        apoloservice = ApolloService.shared
    }
    
    func getArtists<T: Decodable>(byName name: String, after: String? = nil, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        apoloservice.fetch(byQuery: ArtistsQuery(search: name, first: 15, after: after)) { results in
            switch results {
            case .success(let data):
                if let obj = data.decode(type: generalType) {
                    completion(.success(obj))
                }else {
                    completion(.failure(CustomError.NullData))
                }
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}

extension Data {
    func decode<T:Decodable>(type: T.Type) -> T? {
        do {
            let obj = try JSONDecoder().decode(T.self, from: self)
            return obj
        } catch let error {
            print(error)
            return nil
        }
    }
}
