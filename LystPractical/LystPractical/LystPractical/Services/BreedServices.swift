//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

///Custom Datatype Define
typealias BreedSearchResult = (Result<[BreedModel], Error>) -> Void

protocol BreedServicesType: AnyObject {
    func breed(_ completion: @escaping BreedSearchResult)
}

///Write your API logic to parse data into Models
final class BreedServices: BreedServicesType {
    
    static let shared = BreedServices()
    private let network: NetWorkType
    
    private init(network: NetWorkType = Network.shared) {
        self.network = network
    }
    
    /**
     * Name: BreedAPI
     * Return `BreedSearchResult`
     */
    func breed(_ completion: @escaping BreedSearchResult) {
        
        guard let url = URLs.urlBuilder(.breeds) else {
            return completion(.failure(CustomError.NullURL))
        }
        
        let request = URLRequest.builder(url, httpMethod: .GET)
        
        network.api(with: request, model: [BreedModel].self) { results in
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
