//
//  PayCoiniqPracticalTests.swift
//  PayCoiniqPracticalTests
//
//  Created by Vishal on 7/31/21.
//

import XCTest
@testable import PayCoiniqPractical

class PayCoiniqPracticalTests: XCTestCase {

    var viewModel: InputViewModel!
    var coordinator: MockCoordinator!
    
    override func setUp() {
        coordinator = MockCoordinator(navigationController: UINavigationController())
        viewModel = InputViewModel(coordinator: coordinator)
    }
    
    func testAddSpecialCharacter(){
        let actualResult = viewModel.addSpecialCharacterOrResuffel("abcdef")
        XCTAssertEqual(actualResult, "abc-def")
    }
    
    func testAddSpecialCharacterWithReshuffel(){
        let actualResult = viewModel.addSpecialCharacterOrResuffel("abcdef", reshuffle: true)
        XCTAssertEqual(actualResult, "fed-cba")
    }
    
    func testMoveToNext() {
        viewModel.moveToPopUp("abc-def")
        XCTAssertEqual(coordinator.isMoveNextScreen, true)
    }
}

class MockCoordinator: AppCoordinator {
    
    var isMoveNextScreen: Bool = false
    override func popUPViewController(_ text: String) {
        isMoveNextScreen = true
    }
}
