//
//  SessionModel.swift
//
//  Created by Vishal on 7/2/21.
//

import Foundation

struct SessionModel: Codable {
    let access_token: String?
    let token_type: String?
    let refresh_token: String?
    let expires_in: Int?
    let scope: String?
    
    var token: String? {
        guard let token_type = token_type else {
            return nil
        }
        
        guard let access_token = access_token else {
            return nil
        }
        return token_type + " " + access_token
    }
}
