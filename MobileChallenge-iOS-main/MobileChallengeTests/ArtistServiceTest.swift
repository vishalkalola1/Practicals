//
//  ArtistServiceTest.swift
//  MobileChallengeTests
//
//  Created by Vishal on 6/14/21.
//

import Foundation
@testable import MobileChallenge


class ArtistServiceTest: ApolloService, ArtistServicesProtocol {
    func getArtists<T>(byName name: String, after: String?, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        self.fetch(byQuery: ArtistsQuery(search: name, first: 15, after: after)) { results in
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
