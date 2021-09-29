//
//  PlayerViewModelTests.swift
//  ZattooPracticalTests
//
//  Created by Vishal on 7/7/21.
//

import XCTest
@testable import ZattooPractical

class PlayerViewModelTests: XCTestCase {

    var appCoordinator : AppCoordinatorTest?
    var playerViewModel : PlayerViewModel?
    
    override func setUp() {
        super.setUp()
        appCoordinator = AppCoordinatorTest(navigationController: UINavigationController())
        
        let stream = StreamModel(ad: nil, event_pixel: nil, url: "Test", watch_urls: nil, replay_seeking_allowed: nil, quality: nil, teletext_url: nil)
        
        let watchModel = WatchModel(tracking: nil, stream: stream, register_timeshift: nil, csid: nil, youth_protection_pin_required_at: nil, min_connectivity: nil, unregistered_timeshift: nil, message: nil)
        
        playerViewModel = PlayerViewModel(watchModel: watchModel, appCoordinator: appCoordinator!)
    }

    
    func testUrl() {
        XCTAssertTrue(playerViewModel?.url != nil)
    }
    
    func testStopWatch() {
        self.playerViewModel?.stopWatch()
        XCTAssertTrue(true)
    }
    
    func testStopSession() {
        self.playerViewModel?.stopSession()
        XCTAssertTrue(true)
    }
    
    func pop() {
        self.playerViewModel?.pop()
        XCTAssertTrue(appCoordinator?.isPopCalled == true)
    }
}
