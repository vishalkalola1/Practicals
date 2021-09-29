//
//  ArtistDetailsServiceTest.swift
//  MobileChallengeTests
//
//  Created by Vishal on 6/14/21.
//

import Foundation
@testable import MobileChallenge

class ArtistDetailsServiceTest: ApolloService, ArtistDetailsServicesProtocol{
    func getArtist<T>(byid id: String, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        let artistQuery = ArtistQuery(id: id)
        self.fetch(byQuery: artistQuery) { results in
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
