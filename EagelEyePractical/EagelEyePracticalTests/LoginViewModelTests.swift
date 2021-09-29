//
//  EagelEyePracticalTests.swift
//  EagelEyePracticalTests
//
//  Created by Vishal on 7/21/21.
//

import XCTest
@testable import EagelEyePractical

class LoginViewModelTests: XCTestCase {
    
    var mockLoginViewModel: MockLoginViewModel!
    
    override func setUp() async throws {
        mockLoginViewModel = MockLoginViewModel()
    }
    
    func testAuth() {
        mockLoginViewModel.authentication("test", password: "test") { error in
            if let error = error {
                XCTAssertEqual(error, "Username and password is wrong")
            } else {
                XCTAssertEqual(error, nil)
            }
        }
    }
    
    func testmoveToHome() {
        mockLoginViewModel.moveToHome()
        XCTAssertTrue(mockLoginViewModel.moveToHomeFlag)
    }
}

class MockLoginViewModel: LoginViewModelType {
    
    var moveToHomeFlag = false
    func moveToHome() {
        moveToHomeFlag = true
    }
    
    
    func authentication(_ username: String, password: String, completion: @escaping reloadView) {
        if username == "test" && password == "test" {
            completion(nil)
        } else {
            completion("Username and password is wrong")
        }
    }
}
