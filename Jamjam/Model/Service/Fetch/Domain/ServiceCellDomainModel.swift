//
//  ServiceCellDomainModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/9/25.
//

import Foundation

struct ServiceCellDomainModel: Identifiable {
    let thumbnailUrl: String
    let serviceName: String
    let providerName: String
    let salary: Int
    
    let id = UUID() // Identifiable
}
