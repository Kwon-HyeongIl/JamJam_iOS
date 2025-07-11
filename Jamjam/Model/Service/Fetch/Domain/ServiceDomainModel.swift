//
//  ServiceContentDomainModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import Foundation

struct ServiceDomainModel {
    let userId: Int
    let nickname: String
    let profileUrl: String?
    let location: String?
    let serviceId: Int
    let thumbnailUrl: String
    let portfolioImages: [PortfolioImageDomainModel]?
    let serviceName: String
    let description: String
    let salary: Int
    let category: Int
}
