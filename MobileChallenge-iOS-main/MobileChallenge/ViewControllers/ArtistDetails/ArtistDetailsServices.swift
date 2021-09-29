//
//  ArtistDetailsServices.swift
//  MobileChallenge
//
//  Created by Vishal on 6/14/21.
//

import Foundation


protocol ArtistDetailsServicesProtocol: AnyObject {
    func getArtist<T: Decodable>(byid id: String, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class ArtistDetailsServices: ArtistDetailsServicesProtocol {
    
    static let shared = ArtistDetailsServices()

    let apoloservice: ApolloService
    private init(){
        apoloservice = ApolloService.shared
    }
    
    func getArtist<T: Decodable>(byid id: String, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let artistQuery = ArtistQuery(id: id)
        apoloservice.fetch(byQuery: artistQuery) { results in
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
