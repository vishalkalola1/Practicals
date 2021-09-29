//
//  RaboBankPracticalUITests.swift
//  RaboBankPracticalUITests
//
//  Created by Vishal on 7/16/21.
//

import XCTest

final class RaboBankPracticalUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    func testTitleExists() {
        let message = app.staticTexts["Member Profiles"]
        XCTAssert(message.exists)
    }
    
    func testTableExists() {
        let table = app.tables.element
        XCTAssertTrue(table.exists)
    }
    
    func testCellExists() {
        let table = app.tables.element
        if table.cells.count > 0 {
            let cell = table.cells.element(boundBy: 1)
            XCTAssertTrue(cell.exists)
        } else {
            XCTAssertEqual(table.cells.count, 0)
        }
    }
    
    func testPickExists() {
        let button = app.buttons["Pick"]
        XCTAssertTrue(button.exists)
    }
}
