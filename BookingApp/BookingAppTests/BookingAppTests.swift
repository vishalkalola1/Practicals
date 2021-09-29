//
//  BookingAppTests.swift
//  BookingAppTests
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import XCTest
@testable import BookingApp

class BookingAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        ///Initialize Client Object
        let client = Client()
        
        ///Fetch 30 records and compare with boolean Assert
        ///If Condition is pass then Test case is Pass otherwise Fails
        ///Error Object must not be null for showing Userfriendly error
        client.getBookings(30) { (Results) in
            switch Results {
            case .success(let bookings):
                assert(bookings.count==30)
            case .failure(let error):
                assert(error.localizedDescription != "")
            }
        }
        
        ///Fetch 35 records and compare with boolean Assert
        ///If Condition is pass then Test case is Pass otherwise Fails
        ///Error Object must not be null for showing Userfriendly error
        client.getBookings(35) { (Results) in
            switch Results {
            case .success(let bookings):
                assert(bookings.count==35)
            case .failure(let error):
                assert(error.localizedDescription != "")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
