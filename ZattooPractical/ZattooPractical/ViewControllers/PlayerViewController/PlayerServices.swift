//
//  PlayerServices.swift
//  ZattooPractical
//
//  Created by Vishal on 7/5/21.
//

import Foundation

protocol  PlayerServicesType {
    func stopSession(_ completion: @escaping LoginResult)
    func stopChannel(completion: @escaping WatchResult)
}

class PlayerServices: PlayerServicesType {
    
    static let shared = PlayerServices()
    private let network = Network.shared
    
    /**
     * Name: CloseSessionAPI
     * Params: completion
     * Return `LoginResult`
    */
    func stopSession(_ completion: @escaping LoginResult) {
        guard let startSessionUrl = URLs.urlBuilder(.CloseSession) else {
            return completion(.failure(CustomError.NullURL))
        }
        
        let request = URLRequest.builder(startSessionUrl)
        
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
     * Name: StopChannelAPI
     * Params:  completion
     * Return `WatchResult`
    */
    func stopChannel(completion: @escaping WatchResult) {
        
        guard let stopChannelUrl = URLs.urlBuilder(.Stop) else {
            return completion(.failure(CustomError.NullURL))
        }
 
        network.get(stopChannelUrl, model: WatchModel.self) { results in
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
