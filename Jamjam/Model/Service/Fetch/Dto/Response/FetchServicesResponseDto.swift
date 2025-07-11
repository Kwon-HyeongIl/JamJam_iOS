//
//  ServiceListResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/9/25.
//

import Foundation

struct FetchServicesResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let services: [Services]?
        let currentPage: Int
        let totalPages: Int
        let hasNext: Bool
        
        struct Services: Decodable {
            let serviceId: Int
            let thumbnailUrl: String
            let serviceName: String
            let providerName: String
            let salary: Int
        }
    }
}
