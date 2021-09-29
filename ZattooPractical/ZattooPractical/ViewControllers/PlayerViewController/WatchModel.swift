//
//  WatchModel.swift
//  ZattooPractical
//
//  Created by Vishal on 7/5/21.
//

import Foundation

struct WatchModel: Codable {
    let tracking: Tracking?
    var success: Bool = false
    let stream: StreamModel?
    let register_timeshift: String?
    let csid: String?
    let youth_protection_pin_required_at: Int?
    let min_connectivity: String?
    let unregistered_timeshift: String?
    let message: String?
}

struct Tracking: Codable {
    let latency_measurement_interval: Int?
    let event_pixel: String?
}

struct StreamModel: Codable {
    let ad: Ads?
    let event_pixel: String?
    let url: String?
    let watch_urls: [WatchUrl]?
    let replay_seeking_allowed: Bool?
    let quality: String?
    let teletext_url: String?
}

struct Ads: Codable {
    let vast_url: String?
    let type: String?
}

struct WatchUrl: Codable {
    let url: String?
    let maxrate: Int?
    let audio_channel: String?
}


