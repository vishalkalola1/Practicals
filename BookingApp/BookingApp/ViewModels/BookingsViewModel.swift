//
//  BookingsModelView.swift
//  BookingApp
//
//  Created by Vishal on 5/18/21.
//  Copyright © 2021 zenchef. All rights reserved.
//

import UIKit


/// `BookingsViewModel` Bind the `Booking` model and and View
class BookingsViewModel {
    
    private let client = Client()
    private var bookings : [Booking]?
    var selectedBooking : Booking?
    
    init() {
        getAPIData()
    }
    
    ///Get Bookings Data
    func getAPIData() -> Void {
        client.getBookings(25) { results in
            switch results{
            case .success(let bookings):
                self.bookings = bookings
                break;
            case .failure(let error):
                print(error.localizedDescription)
                break;
            }
        }
    }
    
    ///Get the first data from bookings record
    var first : Booking? {
        return bookings?.first
    }
    
    ///Get Total count of Bookings records
    var count : Int? {
        return bookings?.count
    }
    
    ///Get Single Record from Booking array
    func objectAt(_ index: Int) -> Booking? {
        return bookings?[index]
    }
}
