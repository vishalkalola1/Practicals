//
//  Wrappers+string.swift
//  CSVParser
//
//  Created by Vishal on 7/15/21.
//

import Foundation

@propertyWrapper
public struct ReplaceOccurancesAndTrimmed {
    
    @Trimmed private var text: String = ""
    
    public var wrappedValue: String {
        get { return text }
        set { text = newValue.replacingOccurrences(of: "\"", with: "") }
    }

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct Trimmed {
    
    private var text: String = ""
    
    public var wrappedValue: String {
        get { return text }
        set { text = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
