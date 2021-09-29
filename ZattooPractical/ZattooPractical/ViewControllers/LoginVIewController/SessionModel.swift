//
//  SessionModel.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation

struct SessionModel: Codable {
    let message: String?
    var success: Bool = false
    let session: Session?
}

struct Session: Codable {
    let test: Array<String>
    let logo_base_url: String?
    //let vod_providers: [String]? ///Todo: Dont know the actual value here so i comment this line for crash or unwanted behavior
    let start_page_public_id: String?
    let privacy_policy: String?
    let ad_skip_time: Int?
    let image_base_url: String?
    let max_signup_birthdate: String?
    let aliased_country_code: String?
    let power_guide_hash: String?
    let recording_eligible: Bool?
    let ads_allowed: Bool?
    let loggedin: Bool?
    let vod_page_public_id: String?
    let active: Bool?
    let general_terms: String?
    let block_size: Int?
    let broadcast_page_public_id: String?
    let current_time: String?
    let lineup_hash: String?
    let language: String?
    //let tracking_urls: [String]? ///Todo: Dont know the actual value here so i comment this line for crash or unwanted behavior
    let channel_page_public_id: String?
    let recordings_page_public_id: String?
    let min_connectivity: String?
    let ppid: String?
    let html5_streaming : Bool?
    let public_id:String?
    //let recommendation_categories: [String]? ///Todo: Dont know the actual value here so i comment this line for crash or unwanted behavior
    let personal_recommendations: Bool?
    let recall_eligible: Bool?
    let sse_url : String?
    let ab_test_groups: String?
    let recording_subscribable: Bool?
    let vod_eligible: Bool?
    let recording_space_subscribable: Bool?
    let user: User?
    let local_recording_eligible: Bool?
    let recall_subscribable: Bool?
    //let privacy_settings: [String]? ///Todo: Dont know the actual value here so i comment this line for crash or unwanted behavior
    let recommender_system: String?
    let service_region_country: String?
    let recall_seconds: Int?
    let series_recording_eligible: Bool?
    let max_playlist_size: Int?
    let recall_start_time: String?
}

struct Subscriptions: Codable {
    let sku: String?
    let autorenewal_failed: Bool?
    let may_autorenew: Bool?
    let autorenewing: Bool?
    let id: Int?
    let shop_id: String?
    let expiration: String?
    let service_id: Int?
    let beginning: String?
    let external_autorenewing: Bool?
}

struct Product: Codable {
    let sku: String?
    let name: String?
    let vat_amount: Int?
    let is_trial: Bool?
    let shop_id: String?
    let month_count: Int?
    let currency: String?
    let length: Int?
    let cost: Int?
    //let groups: [String]? ///Todo: Dont know the actual value here so i comment this line for crash or unwanted behavior
    let units: String?
    let service_id: Int?
    let active: Bool?
    let description: String?
}

struct Service: Codable {
    //let possible_cids: [String]? ///Todo: Dont know the actual value here so i comment this line for crash or unwanted behavior
    let blocked_service_ids: [Int]?
    let description: String?
    let image: String?
    let is_adult: Bool?
    let sort_order: Int?
    let active: Bool?
    let id: Int?
    let blocking_service_ids: [Int]?
    let name: String?
    let shop_url: String?
    let tnc_url: String?
    let type: String?
}

struct User: Codable {
    let restricted_usage_limit: Int?
    let public_id: String?
    let subscriptions: [Subscriptions]?
    let redeemed_trial_service_ids: [Int]?
    let variant_group: Int?
    let restricted_usage_reset: Int?
    let services: [Service]?
    let youth_protection_required: Bool?
    let dateregistered: String?
    let products: [Product]?
    let restricted_usage_so_far: Int?
    let login: String?
    let user_type: UserType?
    let zuya_permissions: [String]?
}

struct UserType: Codable {
    let bi_broad_type: String?
    let bi_detail_type: String?
    let bi_bundle_type: String?
}
