//
//  RecordingsViewModel.swift
//  MobileChallenge
//
//  Created by Vishal on 6/13/21.
//

import Foundation


struct RecordingsViewModel {
    
    let id: String
    let title: String
    var length: String
    var video: Bool
    
    init(_ node: Recordings.Node) {
        self.id = node.id ?? ""
        self.title = node.title ?? ""
        self.length = node.length ?? ""
        self.video = node.video ?? false
    }
    
}
