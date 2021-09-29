//
//  Parser.swift
//  CSVParser
//
//  Created by Vishal on 7/13/21.
//

import Foundation

struct Parser {
    
    private static var lineSeperator: String {
        "\r\n"
    }
    
    public static func parse(rows lines:[String], columns: [String], delimeter: String) throws -> [[String:Any]] {
        guard lines.count > 0 else { throw CSVError("No data availabel into CSV") }
        let csvArray = try lines.dropFirst().enumerated().map({ (index, line) -> [String:Any] in
            let rows = line.split(delimeter: delimeter)
            guard rows.count > 0, rows.count == columns.count else { throw CSVError("Invalid CSV data at line number \(index + 1) \(line)") }
            let dict = makeDictionary(columns, rows: rows)
            return dict
        })
        return csvArray
    }
    
    private static func makeDictionary(_ columns: [String], rows: [String]) -> [String:Any] {
        let rowDict = rows.enumerated().reduce([String:String]()) { (rowDict, lineArray) in
            let (index, object) = lineArray
            var rowDict = rowDict
            rowDict[columns[index]] = replaceOccurances(object)
            return rowDict
        }
        return rowDict
    }
    
    public static func trimAndSplit(_ csvString: String, delimeter: String = Parser.lineSeperator) -> [String] {
        @Trimmed var trimLines = csvString
        return trimLines.split(delimeter: delimeter)
    }
    
    public static func parse(headers line: String, delimeter: String) throws -> [String] {
        var headers = trimAndSplit(line, delimeter: delimeter)
        guard headers.count > 0 else { throw CSVError("Invalid CSV data and delimeter") }
        headers = headers.map({
            return replaceOccurances($0)
        })
        return headers
    }
    
    private static func replaceOccurances(_ string: String) -> String {
        @ReplaceOccurancesAndTrimmed var obj = string
        return obj
    }
}

