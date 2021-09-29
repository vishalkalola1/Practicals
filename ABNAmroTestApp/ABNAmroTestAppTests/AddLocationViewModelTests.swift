//
//  AddLocationViewModelTests.swift
//  AddLocationViewModelTests
//
//  Created by Vishal on 7/5/21.
//

import XCTest
@testable import ABNAmroTestApp

class AddLocationViewModelTests: XCTestCase {

    private var addlocationViewModel: AddLocationViewModel!
    private var locationViewModel : LocationsViewModel!
    private var appMock : MockAppCoordinator!
    
    override func setUp() {
        super.setUp()
        let mock = MockRefreshViewDelegate()
        appMock = MockAppCoordinator(navigationController: UINavigationController())
        locationViewModel = LocationsViewModel(delegate: mock, appCoordinator: appMock)
        addlocationViewModel = AddLocationViewModel(delegate: locationViewModel, appCoordinator: appMock)
    }
    
    func testSaveLocation() {
        addlocationViewModel.saveAction("Xyz", lat: 1.0011113, long: 2.00003444)
        XCTAssertEqual(locationViewModel.locations.count, 1)
    }
    
    func testPopToLocationsScreen() {
        addlocationViewModel.popToLocationsScreen()
        XCTAssertTrue(appMock.popToLocationScreenCalled)
    }
}
