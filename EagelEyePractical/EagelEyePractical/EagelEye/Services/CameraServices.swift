//
//  LoginServices.swift
//
//  Created by vishal on 02/07/2021.
//  Copyright © 2021 vishal. All rights reserved.
//

import Foundation

///Custom Datatype Define
typealias CameraResult = (Result<[CameraModel], Error>) -> Void
typealias CameraStatusResult = (Result<CameraStatusModel, Error>) -> Void

protocol CameraServicesType: AnyObject {
    func cameras(_ completion: @escaping CameraResult)
    func cameraStatus(_ id: String, completion: @escaping CameraStatusResult)
}

///Write your API logic to parse data into Models
final class CameraServices: CameraServicesType {
    
    static let shared = CameraServices()
    private let network: NetWorkType
    
    private init(network: NetWorkType = Network.shared) {
        self.network = network
    }
    
    /**
     * Name: camerasAPI
     * Return `CameraResult`
    */
    func cameras(_ completion: @escaping CameraResult) {
        
        guard let url = URLs.urlBuilder(.cameras) else {
            return completion(.failure(CustomError.NullURL))
        }
        
        guard let token = UserDefaults.standard.token else {
            return completion(.failure(CustomError.NoToken))
        }
        
        let headers = ["Authorization": token]
        let request = URLRequest.builder(url, httpMethod: .GET, headers: headers as [String:Any])
        
        network.api(with: request, model: [CameraModel].self) { results in
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
    
    func cameraStatus(_ id: String, completion: @escaping CameraStatusResult) {
        let urlString = EndPoints.cameras.url + id + EndPoints.cameraStatus.url
        
        guard let url = URLs.urlPathBuilder(urlString) else {
            return completion(.failure(CustomError.NullURL))
        }
        
        guard let token = UserDefaults.standard.token else {
            return completion(.failure(CustomError.NoToken))
        }
        
        let headers = ["Authorization": token]
        let request = URLRequest.builder(url, httpMethod: .GET, headers: headers as [String:Any])
        
        network.api(with: request, model: CameraStatusModel.self) { results in
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
