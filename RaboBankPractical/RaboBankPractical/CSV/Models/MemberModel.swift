//
//  CSVModel.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/14/21.
//

import Foundation

struct MemberModel: Codable {
    
    let firstName: String?
    let surname: String?
    let issueCount: Int?
    let dateOfBirth: String?
    
    var fullName: String {
        (firstName ?? "") + " " + (surname?.capitalized ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "First name"
        case surname = "Sur name"
        case issueCount = "Issue count"
        case dateOfBirth = "Date of birth"
    }
    
    init(from decoder: Decoder) throws {
        let modelContainer = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try modelContainer.decode(String.self, forKey: .firstName)
        surname = try modelContainer.decode(String.self, forKey: .surname)
        issueCount = Int(try modelContainer.decode(String.self, forKey: .issueCount))
        dateOfBirth = try modelContainer.decode(String.self, forKey: .dateOfBirth)
    }
}
