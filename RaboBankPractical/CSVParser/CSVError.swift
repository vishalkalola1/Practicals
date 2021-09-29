//
//  CSVError.swift
//  CSVParser
//
//  Created by Vishal on 7/13/21.
//

import Foundation

public struct CSVError: LocalizedError {
    
    private let message: String
    
    public var errorDescription: String? {
        message
    }
    
    public init(_ message: String) {
        self.message = message
    }
}
