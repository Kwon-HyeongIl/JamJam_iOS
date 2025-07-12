//
//  ProviderDomainModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import Foundation

struct ProviderDomainModel {
    let userId: Int
    let category: SkillCategory?
    let location: String
    let introduction: String
    let contactHours: ContackHours
    let averageResponseTime: String
    let detailSkills: [String]?
    let careers: [CareerDomainModel]?
    let educations: [EducationDomainModel]?
    let licenses: [LicenseDomainModel]?
    let profileUrl: String
    let nickname: String
    let services: [ServiceCellDomainModel]?
    
    struct ContackHours {
        let startHour: Int?
        let endHour: Int?
    }
    
    init(fromFetchOtherProviderResponseDtoContent from: FetchProviderProfileResponseDto.Content, userId: Int) {
        self.userId = userId
        category = SkillCategory(rawValue: from.categoryId)
        location = from.location
        introduction = from.introduction
        contactHours = ContackHours(startHour: from.contactHours?.startHour, endHour: from.contactHours?.endHour)
        averageResponseTime = from.averageResponseTime
        detailSkills = from.skills?.compactMap { ProfileInfoManager.extractDetailSkillTextWithId(id: $0.id) }
        careers = from.careers?.map { CareerDomainModel(
            id: $0.id,
            company: $0.company,
            position: $0.position
        ) }
        educations = from.educations?.map { EducationDomainModel(
            id: $0.id,
            school: $0.school,
            major: $0.major,
            degree: $0.degree
        ) }
        licenses = from.licenses?.map { LicenseDomainModel(
            id: $0.id,
            name: $0.name
        ) }
        profileUrl = from.profileUrl
        nickname = from.nickname
        services = from.services?.map { ServiceCellDomainModel(
            serviceId: $0.serviceId,
            thumbnailUrl: $0.thumbnailUrl,
            serviceName: $0.serviceName,
            providerName: $0.providerName,
            salary: $0.salary
        ) }
    }
}
