//
//  PayCoiniqPracticalUITests.swift
//  PayCoiniqPracticalUITests
//
//  Created by Vishal on 7/31/21.
//

import XCTest

class PayCoiniqPracticalUITests: XCTestCase {
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        XCUIDevice.shared.orientation = .portrait
        XCTAssertEqual(app.textFields["textField"].exists, true)
        XCTAssertEqual(app.buttons["popup"].exists, true)
        app.textFields["textField"].tap()
        app.textFields["textField"].clearText()
        app.textFields["textField"].typeText("abcdef")
        let button = app.buttons["popup"]
        button.tap()
        if XCUIDevice.shared.orientation ==  .landscapeLeft || XCUIDevice.shared.orientation ==  .landscapeRight{
            XCTAssertEqual(app.images["logo"].exists, false)
        } else {
            XCTAssertEqual(app.images["logo"].exists, true)
        }
        XCTAssertEqual(app.staticTexts["title"].exists, true)
        XCTAssertEqual(app.staticTexts["discription"].exists, true)
        XCTAssertEqual(app.buttons["dismiss"].exists, true)
        XCTAssertEqual(app.buttons["reshuffle"].exists, true)
        app.buttons["dismiss"].tap()
        XCTAssertEqual(app.textFields["textField"].value as! String, "abc-def")
        XCUIDevice.shared.orientation = .landscapeLeft
        button.tap()
        if XCUIDevice.shared.orientation ==  .landscapeLeft || XCUIDevice.shared.orientation ==  .landscapeRight{
            XCTAssertEqual(app.images["logo"].exists, false)
        } else {
            XCTAssertEqual(app.images["logo"].exists, true)
        }
        app.buttons["reshuffle"].tap()
        XCTAssertEqual(app.textFields["textField"].value as! String, "fed-cba")
    }
}

extension XCUIElement {
    
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }
        
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
}
