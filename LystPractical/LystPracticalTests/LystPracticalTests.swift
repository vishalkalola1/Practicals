//
//  LystPracticalTests.swift
//  LystPracticalTests
//
//  Created by Vishal on 7/29/21.
//

import XCTest
@testable import LystPractical

class LystPracticalTests: XCTestCase {
    
    var viewModel: BreedSearchViewModel!
    var coordinator: MockCoordinator!
    
    override func setUp() {
        coordinator = MockCoordinator(navigationController: UINavigationController())
        viewModel = BreedSearchViewModel(coordinator: coordinator)
    }
    
    func testBreeds() {
        let semaphore = DispatchSemaphore(value: 0)
        viewModel.breeds { error in
            XCTAssertTrue(self.viewModel.filterBreed.count > 0)
            semaphore.signal()
        }
        semaphore.wait()
    }
    
    func testNumberOfSection() {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }
    
    func testNumberOfRows() {
        let semaphore = DispatchSemaphore(value: 0)
        viewModel.breeds { error in
            XCTAssertGreaterThan(self.viewModel.numberOfRows, 0)
            semaphore.signal()
        }
        semaphore.wait()
        
    }
    
    func testBreedAt() {
        let semaphore = DispatchSemaphore(value: 0)
        viewModel.breeds { error in
            let actualResult = self.viewModel.breed(at: 1)
            XCTAssertNotNil(actualResult)
            semaphore.signal()
        }
        semaphore.wait()
        
    }
    
    func testBreedSelect() {
        let semaphore = DispatchSemaphore(value: 0)
        viewModel.breeds { error in
            self.viewModel.breed(didSelectAt: 1)
            XCTAssertTrue(self.coordinator.navigateToBreedDetails)
            semaphore.signal()
        }
        semaphore.wait()
        
    }
    
    func testSearch() {
        let semaphore = DispatchSemaphore(value: 0)
        viewModel.breeds { error in
            self.viewModel.searchBreed("Abyssinian") { _ in
                XCTAssertEqual(self.viewModel.filterBreed.count, 1)
                semaphore.signal()
            }
        }
        semaphore.wait()
       
    }
}

class MockCoordinator: BreedSearchCoordinator {
    
    var navigateToBreedDetails = false
    override func navigateToBreedDetailsCoordinator(_ breed: BreedModel) {
        navigateToBreedDetails = true
    }
}
