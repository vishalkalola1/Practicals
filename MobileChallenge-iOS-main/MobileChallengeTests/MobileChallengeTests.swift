//
//  MobileChallengeTests.swift
//  MobileChallengeTests
//
//  Created by Vishal on 6/14/21.
//

import XCTest
@testable import MobileChallenge

class MobileChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        artistFetching()
        artistDetailsFetching()
        favouriteFetching()
    }
    
    
    func artistFetching() -> Void {
        let expectation = expectation(description: "artist")
        let artistServiceTest = ArtistServiceTest()
        artistServiceTest.getArtists(byName: "John Mayer", after: nil, generalType: Artist.self) { results in
            switch results {
            case .success(let artist):
                XCTAssert(artist.search != nil)
                
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5){ error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }//Wait block end
    }
    
    func artistDetailsFetching() -> Void {
        let expectation = expectation(description: "artistDetails")
        let artist = ArtistDetailsServiceTest()
        artist.getArtist(byid: "QXJ0aXN0OjE0NGVmNTI1LTg1ZTktNDBjMy04MzM1LTAyYzMyZDA4NjFmMw==", generalType: ArtistsDetails.self) { results in
            switch results {
            case .success(let artist):
                XCTAssert(artist.node != nil)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5){ error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func favouriteFetching() -> Void {
        let favouritetest = FavoriteServiceTest()
        
        do {
            let data = try favouritetest.getAll(DataFrom: "Favorite")
            XCTAssert(data.count > 0)
            let onedata = try favouritetest.getOne(entity: "Favorite", id: "QXJ0aXN0OjE0NGVmNTI1LTg1ZTktNDBjMy04MzM1LTAyYzMyZDA4NjFmMw==")
            XCTAssert(onedata == nil)
            try favouritetest.delete(entity: "Favorite", id: "QXJ0aXN0OjE0NGVmNTI1LTg1ZTktNDBjMy04MzM1LTAyYzMyZDA4NjFmMw==")
            XCTAssert(true)
        }catch let error {
            print(error.localizedDescription)
            XCTAssert(false)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
