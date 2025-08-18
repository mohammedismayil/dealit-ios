//
//  UserDetailsAPIModel.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 18/08/25.
//

import Foundation

struct UserDetailsAPIModel: Codable {
    let userDetails: UserData
    
    // Use CodingKeys to map the snake_case "user_details" from JSON
    // to the camelCase "userDetails" in Swift.
    private enum CodingKeys: String, CodingKey {
        case userDetails = "user_details"
    }
}

// Represents the value of the "user_details" key.
// It contains two inner objects: "personal_details" and "professional_details".
struct UserData: Codable {
    let personalDetails: PersonalDetails
    let professionalDetails: ProfessionalDetails
    
    // Use CodingKeys for the two snake_case JSON keys.
    private enum CodingKeys: String, CodingKey {
        case personalDetails = "personal_details"
        case professionalDetails = "professional_details"
    }
}

// Represents the value of the "personal_details" key.
struct PersonalDetails: Codable {
    let name: String
    let age: Int
    let education: EducationDetails
}

// Represents the value of the "education" key.
struct EducationDetails: Codable {
    let degree: String
    let degreePercentage: Int
    let sslcPercentage: Int
    
    // Use CodingKeys for the snake_case JSON keys.
    private enum CodingKeys: String, CodingKey {
        case degree
        case degreePercentage = "degree_percentage"
        case sslcPercentage = "sslc_percentage"
    }
}

// Represents the value of the "professional_details" key.
struct ProfessionalDetails: Codable {
    let role: String
    let experience: Int
    let joinedYear: Int
    
    // Use CodingKeys for the snake_case JSON key.
    private enum CodingKeys: String, CodingKey {
        case role
        case experience
        case joinedYear = "joined_year"
    }
}
