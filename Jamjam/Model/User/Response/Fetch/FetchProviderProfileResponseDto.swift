//
//  FetchOtherProviderResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import Foundation

struct FetchProviderProfileResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let categoryId: Int
        let location: String
        let introduction: String
        let contactHours: ContactHours?
        let averageResponseTime: String
        let skills: [DetailSkill]?
        let careers: [Career]?
        let educations: [Education]?
        let licenses: [License]?
        let profileUrl: String
        let nickname: String
        let services: [Service]?
        
        struct ContactHours: Decodable {
            let startHour: Int
            let endHour: Int
        }
        
        struct DetailSkill: Decodable {
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
        
        struct License: Decodable {
            let id: Int
            let name: String
        }
        
        struct Service: Decodable {
            let serviceId: Int
            let thumbnailUrl: String
            let serviceName: String
            let providerName: String
            let salary: Int
        }
    }
}
