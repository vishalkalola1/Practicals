//
//  CSVModel.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/14/21.
//

import Foundation

struct TestModel: Codable {
    
    let firstName: String?
    let surName: String?
    let issueCount: Int?
    let dateOfBirth: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "First name"
        case surName = "Sur name"
        case issueCount = "Issue count"
        case dateOfBirth = "Date of birth"
    }
    
    init(from decoder: Decoder) throws {
        let modelContainer = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try modelContainer.decode(String.self, forKey: .firstName)
        surName = try modelContainer.decode(String.self, forKey: .surName)
        issueCount = Int(try modelContainer.decode(String.self, forKey: .issueCount))
        dateOfBirth = try modelContainer.decode(String.self, forKey: .dateOfBirth)
    }
}
