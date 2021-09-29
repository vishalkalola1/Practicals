//
//  LoginServices.swift
//
//  Created by vishal on 02/07/2021.
//  Copyright © 2021 vishal. All rights reserved.
//

import Foundation

///Custom Datatype Define
typealias LoginResult = (Result<SessionModel, Error>) -> Void

protocol LoginServicesType: AnyObject {
    func login(_ username: String, password: String, completion: @escaping LoginResult)
}


///Write your API logic to parse data into Models
class LoginServices: LoginServicesType {
    
    static let shared = LoginServices()
    private let network: NetWorkType
    
    private init(network: NetWorkType = Network.shared) {
        self.network = network
    }
    
    private enum Constant {
        static let ID = "dev_test"
        static let SECRET = "3H1Bf6mCctIgpCuzvrnyekf3VhAUEnKJ"
        static let TYPE = "Basic"
    }
    
    private var authKey: String {
        Constant.TYPE + " " + (Constant.ID + ":" + Constant.SECRET).toBase64()
    }
    
    /**
     * Name: LoginAPI
     * Params: UserName, Password, completion
     * Return `LoginResult`
    */
    func login(_ username: String, password: String, completion: @escaping LoginResult) {
        
        let queryParams = [URLQueryItem(name: "grant_type", value: "password"),
                           URLQueryItem(name: "scope", value: "write"),
                           URLQueryItem(name: "username", value: username),
                           URLQueryItem(name: "password", value: password)
                          ]
        
        guard let startSessionUrl = URLs.urlBuilder(.login, queryItems: queryParams) else {
            return completion(.failure(CustomError.NullURL))
        }
        print(authKey)
        let headers = ["Authorization": authKey]
        
        let request = URLRequest.builder(startSessionUrl, headers: headers)
        
        network.api(with: request, model: SessionModel.self) { results in
            switch results {
            case .success(let result):
                completion(.success(result))
                break;
            case .failure(let error):
                completion(.failure(error))
                break;
            }
        }
    }
}
