//
//  TagsViewModel.swift
//  MobileChallenge
//
//  Created by Vishal on 6/14/21.
//

import Foundation


struct TagsViewModel {
    let name: String
    let count: Int
    
    init(_ tag: Tags.Node) {
        self.name = tag.name ?? ""
        self.count = tag.count ?? 0
    }
}
