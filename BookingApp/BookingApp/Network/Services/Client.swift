//
//  Client.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import Foundation

///Custom Datatype Define
typealias BookingsResult = (Result<[Booking], Error>) -> Void


///Write your API logic to parse data into Models
class Client {
    
    ///Get number of bookings
    /// Params: Int, CompletionHandler
    /// Return `BookingsResult`
    func getBookings(_ maxBooking: Int, completion: @escaping BookingsResult) {
        
        let urls = URls(URLQueryItem(name: "results", value: "\(maxBooking)"))
        guard let resulturl = urls.geturl() else {
            return completion(.failure(CustomError.NullURL))
        }
        
        Network.get(url: resulturl, generalType: UserResultList.self) { results in
            switch results {
            case .success(let result):
                if let result = result.results{
                    let bookings = result.map { User(firstName: $0.name?.first ?? "",
                                                    lastName: $0.name?.last ?? "",
                                                    gender: $0.gender ?? .female,
                                                    email: $0.email,
                                                    phone: $0.phone )
                    }.map({ Booking(user: $0) })
                    completion(.success(bookings))
                }else{
                    completion(.failure(CustomError.NullData))
                }
                break;
                
            case .failure(let error):
                completion(.failure(error))
                break;
            }
        }
    }
}
