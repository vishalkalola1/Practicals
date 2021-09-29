//
//  ZattooPracticalTests.swift
//  ZattooPracticalTests
//
//  Created by Vishal on 7/2/21.
//

import XCTest
@testable import ZattooPractical

class LoginViewModelTests: XCTestCase {

    var loginViewModel : LoginViewModel?
    var appCoordinator : AppCoordinatorTest?
    
    override func setUp() {
        super.setUp()
        appCoordinator = AppCoordinatorTest(navigationController: UINavigationController())
        loginViewModel = LoginViewModel(appCoordinator: appCoordinator!)
    }
    
    func testLogin() {
        let credentials = ["login":"devtask",
                           "password":"3l3cz1"]
        let semaphore = DispatchSemaphore(value: 0)

        loginViewModel?.authentication(credentials, completion: { error in
            if error != nil {
                XCTAssertTrue(self.loginViewModel?.sessionModel == nil)
            }else {
                XCTAssertTrue(self.loginViewModel?.sessionModel != nil)
            }
            semaphore.signal()
        })
        semaphore.wait()
    }
    
    func testStartSession() {
        let session = [
            "app_tid" : "8a302808-6433-4960-967c-920192a835be",
            "uuid" : "\(UUID())",
            "lang":"en",
            "format":"json"
        ]
        let semaphore = DispatchSemaphore(value: 0)
        loginViewModel?.startSession(session, completion: { error in
            if error != nil {
                XCTAssertTrue(self.loginViewModel?.sessionModel == nil)
            }else {
                XCTAssertTrue(self.loginViewModel?.sessionModel != nil)
            }
            semaphore.signal()
        })
        semaphore.wait()
    }
    
    func testStartWatch() {
        let semaphore = DispatchSemaphore(value: 0)
        loginViewModel?.startWatch(completion: { error in
            if error != nil {
                XCTAssertTrue(self.loginViewModel?.watchModel == nil)
            }else {
                XCTAssertTrue(self.loginViewModel?.watchModel != nil)
            }
            semaphore.signal()
        })
        semaphore.wait()
    }
    
    func testStartVideo() {
        loginViewModel?.watchModel = WatchModel(tracking: nil, stream: nil, register_timeshift: nil, csid: nil, youth_protection_pin_required_at: nil, min_connectivity: nil, unregistered_timeshift: nil, message: nil)
        loginViewModel?.startVideo()
        XCTAssertTrue(appCoordinator?.isPushedToVideoPlayer == true)
    }

}

class AppCoordinatorTest: AppCoordinator {
    
    
    var isPushedToVideoPlayer = false
    
    override func VideoPlayer(playerViewModel: PlayerViewModel){
        isPushedToVideoPlayer = true
    }
    
    var isPopCalled = false
    override func pop() {
        isPopCalled = true
    }
}
