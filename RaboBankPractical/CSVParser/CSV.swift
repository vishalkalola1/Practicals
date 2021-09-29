//
//  CSV.swift
//  CSVParser
//
//  Created by Vishal on 7/13/21.
//

import Foundation

public class CSV {
    
    public let delimeter: String
    public let url: URL
    
    public init(url: URL, delimeter: String = ",") {
        self.delimeter = delimeter
        self.url = url
    }
    
    public func parseCSV<T:Codable>(into model: [T].Type) throws -> [T] {
        let csvData = try loadDataFromUrl(url.path)
        let trimmedData = Parser.trimAndSplit(csvData)
        let headers = try Parser.parse(headers: trimmedData.first ?? "", delimeter: delimeter)
        let rows = try Parser.parse(rows: trimmedData, columns: headers, delimeter: delimeter)
        let data = try rows.toJson()
        let object = try data.map(model: model)
        return object
    }
    
    private func loadDataFromUrl(_ url: String) throws -> String {
        return try String(contentsOfFile: url)
    }
}
