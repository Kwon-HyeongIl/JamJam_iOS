//
//  ServiceCellDomainModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/9/25.
//

import Foundation

struct ServiceCellDomainModel: Hashable, Equatable {
    let serviceId: Int
    let thumbnailUrl: String
    let serviceName: String
    let providerName: String
    let salary: Int
}
