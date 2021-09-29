//
//  ApolloClient.swift
//  MobileChallenge
//
//  Created by Vishal on 6/10/21.
//

import Foundation
import Apollo

class ApolloService {
    
    static let shared = ApolloService()
    internal private(set) var apollo = ApolloClient(url: URL(string: "https://graphbrainz.herokuapp.com/")!)
    
    func fetch<Query:GraphQLQuery>(byQuery query: Query, completionHandler: @escaping (Result<Data, Error>) -> Void)  {
        apollo.fetch(query: query) { results in
            switch results {
            case .success(let resultLocal):
                if let resultData = resultLocal.data {
                        guard let data = resultData.jsonObject.dataObj else {
                            completionHandler(.failure(CustomError.NullData));
                            return
                        }
                    completionHandler(.success(data))
                }else {
                    completionHandler(.failure(CustomError.NullData))
                }
                break
            case .failure(let error):
                completionHandler(.failure(error))
                break
            }
        }
    }
}

extension Apollo.JSONObject {
    var dataObj: Data? {
        do {
            let obj = try JSONSerialization.data(withJSONObject: self, options: [])
            return obj
        }catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
