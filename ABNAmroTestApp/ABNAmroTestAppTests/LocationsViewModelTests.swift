//
//  ABNAmroTestAppTests.swift
//  ABNAmroTestAppTests
//
//  Created by Vishal on 7/5/21.
//

import XCTest
@testable import ABNAmroTestApp

class LocationsViewModelTests: XCTestCase {

    private var locationViewModel: LocationsViewModel!
    
    override func setUp() {
        super.setUp()
        let mock = MockRefreshViewDelegate()
        let appMock = MockAppCoordinator(navigationController: UINavigationController())
        locationViewModel = LocationsViewModel(delegate: mock, appCoordinator: appMock)
    }
    
    func testLocations() {
        let location = Location(name: "Xyz", lat: 1.0011113, long: 2.00003444)
        locationViewModel.add(location: location)
        XCTAssertEqual(locationViewModel.locations.count, 1)
        
        let location2 = Location(name: "Xyz", lat: 1.0011113, long: 2.00003444)
        locationViewModel.add(location: location2)
        XCTAssertEqual(locationViewModel.locations.count, 2)
    }
    
    func testReadFile() {
        let data = try! locationViewModel.readFile()
        XCTAssertNotNil(data)
    }
    
    func testMakeUrl() {
        let url = locationViewModel.makeUrl(for: LocationsCellViewModel(name: "test", lat: 1.045666, long: 1.65056805))
        XCTAssertNotNil(url)
    }
    
    func testloadJson() {
        guard let data = try! locationViewModel.readFile() else { XCTAssertFalse(true); return }
        try! locationViewModel.loadJson(data: data)
        XCTAssertEqual(locationViewModel.locations.count, 4)
    }
    
    func testNumberOfSection() {
        XCTAssertEqual(locationViewModel.numberOfSections, 1)
    }
    
    func testNumberOfRows() {
        locationViewModel.locations = [Location(name: "Dummy", lat: 1.705948, long: 41.40515),
                                       Location(name: "Dummy1", lat: 1.705949, long: 41.40525),
                                       Location(name: "Dummy2", lat: 1.705940, long: 41.40535),
                                       Location(name: "Dummy3", lat: 1.705944, long: 41.40545),
                                       Location(name: "Dummy4", lat: 1.705943, long: 41.40555)]
        XCTAssertEqual(locationViewModel.numberOfRows, 5)
    }
}

class MockRefreshViewDelegate: RefreshViewDelegate  {
    func reload() {
        
    }
}

class MockAppCoordinator: AppCoordinator  {
    
    var popToLocationScreenCalled = false
    override func popToLocationsScreen() {
        popToLocationScreenCalled = true
    }
}
