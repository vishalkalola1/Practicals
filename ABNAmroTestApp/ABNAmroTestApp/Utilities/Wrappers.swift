//
//  Wrappers.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/6/21.
//

import Foundation


@propertyWrapper
struct ReplaceSpace {
    private var text: String
    
    var wrappedValue: String {
        get { return text }
        set { text = newValue.replacingOccurrences(of: " ", with: "") }
    }
    
    init() {
        text = ""
    }
    init(wrappedValue: String) {
        text = wrappedValue.replacingOccurrences(of: " ", with: "")
    }
}
