//
//  CSVParserTests.swift
//  CSVParserTests
//
//  Created by Vishal on 7/13/21.
//

import XCTest
@testable import CSVParser

final class ParserTests: XCTestCase {
    
    let delimeter = ","
    let csvString = "\"First name\",\"Sur name\",\"Issue count\",\"Date of birth\"\r\n" +
                "\"Theo\",\"Jansen\",5,\"1978-01-02T00:00:00\"\r\n" +
                "\"Fiona\",\"de Vries\",7,\"1950-11-12T00:00:00\"\r\n" +
                "\"Petra\",\"Boersma\",5,\"2001-04-20T00:00:00\"\r\n"
    
    func testTrimmedAndSplit() {
        let lines = Parser.trimAndSplit(csvString)
        XCTAssert(lines.count == 4)
    }
    
    func testHeaderParse() {
        let lines = Parser.trimAndSplit(csvString)
        let headers = try! Parser.parse(headers: lines.first!, delimeter: delimeter)
        XCTAssertTrue(headers.count == 4)
    }
    
    func testRowsParse() {
        let lines = Parser.trimAndSplit(csvString)
        let headers = try! Parser.parse(headers: lines.first!, delimeter: delimeter)
        let rows = try! Parser.parse(rows: lines, columns: headers, delimeter: delimeter)
        XCTAssertTrue(rows.count == 3)
    }
}
