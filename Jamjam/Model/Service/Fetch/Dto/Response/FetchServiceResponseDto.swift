//
//  FetchServiceResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import Foundation

struct FetchServiceResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let userId: Int
        let nickName: String
        let profileUrl: String?
        let location: String?
        let serviceId: Int
        let thumbnail: String
        let portfolioImages: [PortfolioImage]?
        let serviceName: String
        let description: String
        let salary: Int
        let category: Int
        
        struct PortfolioImage: Decodable {
            let id: Int
            let url: String
        }
    }
}
