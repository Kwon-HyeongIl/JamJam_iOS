//
//  FetchProviderResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import Foundation

struct FetchProviderResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let categoryId: Int
        let location: String
        let introduction: String
        let contactHours: ContactHours?
        let averageResponseTime: String
        let skills: [Skill]?
        let careers: [Career]?
        let educations: [Education]?
        let licenses: [Licenses]?
        
        struct ContactHours: Decodable {
            let startHour: Int
            let endHour: Int
        }
        
        struct Skill: Decodable {
            let id: Int
            let name: String
        }
        
        struct Career: Decodable {
            let id: Int
            let company: String
            let position: String
        }
        
        struct Education: Decodable {
            let id: Int
            let school: String
            let major: String
            let degree: String
        }
        
        struct Licenses: Decodable {
            let id: Int
            let name: String
        }
    }
}
