//
//  Artist.swift
//  MobileChallenge
//
//  Created by Vishal on 6/10/21.
//

import Foundation

struct Artist: Codable {
    let search: Search?
}

struct Search: Codable {
    let artists: Artists?
}

struct Artists: Codable {
    struct Node: Codable {
        let id: String?
        let name: String?
        let disambiguation: String?
        let area: Area?
        let type: String?
        let recordings: Recordings?
        let rating: Rating?
        let sortName: String?
        let country: String?
        let gender: String?
        let lifeSpan: LifeSpan?
        let tags: Tags?
        let theAudioDB: TheAudioDB?
    }
    var nodes: [Artists.Node]?
    var pageInfo: PageInfo?
    var totalCount: Int?
}

struct ArtistsDetails: Codable {
    var node: Artists.Node?
}

struct TheAudioDB: Codable {
    let banner: String?
    let logo: String?
    var memberCount: Int?
    let genre: String?
    let mood: String?
    let style: String?
}

struct Tags: Codable {
    struct Node: Codable {
        let name: String?
        let count: Int?
    }
    var nodes: [Node]?
}

struct LifeSpan: Codable {
    let begin: String?
    let end: String?
    var ended: Bool?
}

struct PageInfo: Codable {
    var hasNextPage: Bool?
    var hasPreviousPage: Bool?
    let startCursor: String?
    let endCursor: String?
}

struct Recordings: Codable {
    struct Node: Codable {
        let id: String?
        let title: String?
        var length: String?
        var video: Bool?
    }
    var nodes: [Recordings.Node]?
}

struct Area: Codable {
    let id: String?
    let name: String?
}

struct Rating: Codable {
    var value: Double?
    var voteCount: Int?
}
