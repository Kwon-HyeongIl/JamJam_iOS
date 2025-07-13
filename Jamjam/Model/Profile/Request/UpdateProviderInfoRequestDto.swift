//
//  UpdateProviderInfoRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/13/25.
//

import Foundation

struct UpdateProviderInfoRequestDto: Encodable {
    let deletedSkillIds: [Int]?
    let deletedCareerIds: [Int]?
    let skills: [Skill]
    let deletedEducationIds: [Int]?
    let educations: [Education]?
    let contactHours: ContactHours
    let deletedLicenseIds: [Int]?
    let licenses: [License]?
    let careers: [Career]?
    let location: String
    let categoryId: Int
    let introduction: String
    
    struct Skill: Encodable {
        let id: Int
        let name: String
    }
    
    struct Education: Encodable {
        let id: Int
        let school: String
        let major: String
        let degree: String
    }
    
    struct ContactHours: Encodable {
        let startHour: String
        let endHour: String
    }
    
    struct License: Encodable {
        let id: Int
        let name: String
    }
    
    struct Career: Encodable {
        let id: Int
        let company: String
        let position: String
    }
}
