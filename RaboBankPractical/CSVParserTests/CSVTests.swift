//
//  CSVParserTests.swift
//  CSVParserTests
//
//  Created by Vishal on 7/13/21.
//

import XCTest
@testable import CSVParser

class CSVTests: XCTestCase {

    var csv : CSV!
    override func setUp() {
        let bundle = Bundle(identifier: "com.andesinfotech.RaboBankPractical")!
        let url = bundle.url(forResource: "issues", withExtension: "csv")!
        csv = CSV(url: url, delimeter: ",")
    }
    
    func testParsing() {
        let testModels = try! csv.parseCSV(into: [TestModel].self)
        XCTAssertTrue(testModels.count == 3)
    }
}
