//
//  BookingAppUITests.swift
//  BookingAppUITests
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import XCTest
import BookingApp

class BookingAppUITests: XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testMode"]
        
        /// - Note: Stop Animation and Run app directly in Testing Mode Due to syncronization issue
        app.launchArguments.append("-isAnimation")
        app.launchArguments.append("false")
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        self.confirmTest()
        self.waitTest()
        self.cancleTest()
    }
    
    func confirmTest() {
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Bookings"].tap()
                app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.buttons["Change Status"].tap()
        app.buttons["Confirm"].tap()
        tabBar.buttons["Home"].tap()
    }
    
    func waitTest() {
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Bookings"].tap()
                app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.buttons["Change Status"].tap()
        app.buttons["Waiting"].tap()
        tabBar.buttons["Home"].tap()
        
    }
    
    func cancleTest() {
        
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Bookings"].tap()
                app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        app.buttons["Change Status"].tap()
        app.buttons["Cancel"].tap()
        tabBar.buttons["Home"].tap()
        
    }
}
