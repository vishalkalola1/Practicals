//
//  Client.swift
//  ZattooPractical
//
//  Created by vishal on 02/07/2021.
//  Copyright © 2021 vishal. All rights reserved.
//

import Foundation

///Custom Datatype Define
typealias LoginResult = (Result<SessionModel, Error>) -> Void
typealias WatchResult = (Result<WatchModel, Error>) -> Void

protocol LoginServicesType: AnyObject {
    func login(_ credentials: [String:String], completion: @escaping LoginResult)
    func startSession(_ sessionBody: [String:String], completion: @escaping LoginResult)
    func startChannel(_ watchBody: [String:String], completion: @escaping WatchResult)
}


///Write your API logic to parse data into Models
class LoginServices: LoginServicesType {
    
    static let shared = LoginServices()
    private let network : Network = .shared
    
    /**
     * Name: LoginAPI
     * Params: credentials, completion
     * Return `LoginResult`
    */
    func login(_ credentials: [String:String], completion: @escaping LoginResult) {
        
        guard let startSessionUrl = URLs.urlBuilder(.Login) else {
            return completion(.failure(CustomError.NullURL))
        }
        
        let request = URLRequest.builder(startSessionUrl, body: credentials)
        
        network.post(request, model: SessionModel.self) { results in
            switch results {
            case .success(let result):
                if result.success == true {
                    completion(.success(result))
                }else {
                    guard let message = result.message else {
                        completion(.failure(CustomError.UnAuthorized))
                        return
                    }
                    let serverError = ServerError(message)
                    completion(.failure(serverError))
                }
                break;
            case .failure(let error):
                completion(.failure(error))
                break;
            }
        }
    }
    
    /**
     * Name: StartSessionAPI
     * Params: sessionBody, completion
     * Return `LoginResult`
    */
    func startSession(_ sessionBody: [String:String], completion: @escaping LoginResult) {
        guard let startSessionUrl = URLs.urlBuilder(.StartSession) else {
            return completion(.failure(CustomError.NullURL))
        }
        
        let request = URLRequest.builder(startSessionUrl, body: sessionBody)
        
        network.post(request, model: SessionModel.self) { results in
            switch results {
            case .success(let result):
                if result.success == true {
                    completion(.success(result))
                }else {
                    guard let message = result.message else {
                        completion(.failure(CustomError.NullData))
                        return
                    }
                    let serverError = ServerError(message)
                    completion(.failure(serverError))
                }
                break;
            case .failure(let error):
                completion(.failure(error))
                break;
            }
        }
    }
    
    /**
     * Name: StartWatchAPI
     * Params: credentials, completion
     * Return `WatchResult`
    */
    func startChannel(_ watchBody: [String:String], completion: @escaping WatchResult) {
        
        guard let watchUrl = URLs.urlBuilder(.Watch) else {
            return completion(.failure(CustomError.NullURL))
        }
 
        let request = URLRequest.builder(watchUrl, body: watchBody)
        
        network.post(request, model: WatchModel.self) { results in
            switch results {
            case .success(let result):
                if result.success == true {
                    completion(.success(result))
                }else {
                    guard let message = result.message else {
                        completion(.failure(CustomError.NullData))
                        return
                    }
                    let serverError = ServerError(message)
                    completion(.failure(serverError))
                }
                break;
            case .failure(let error):
                completion(.failure(error))
                break;
            }
        }
    }
}
