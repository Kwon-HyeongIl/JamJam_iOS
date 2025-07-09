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
        let totalElements: Int
        let totalPages: Int
        let pageable: Pageable
        
        struct Pageable: Decodable {
            let unpaged: Bool
            let paged: Bool
            let pageSize: Int
            let pageNumber: Int
            let offset: Int
            let sort: Sort
            
            struct Sort: Decodable {
                let unsorted: Bool
                let sorted: Bool
                let empty: Bool
            }
        }
        
        let numberOfElements: Int
        let size: Int
        let content: [InContent]?
        
        struct InContent: Decodable {
            let thumbnailUrl: String
            let serviceName: String
            let providerName: String
            let salary: Int
        }
        
        let number: Int
        let sort: Sort
        
        struct Sort: Decodable {
            let unsorted: Bool
            let sorted: Bool
            let empty: Bool
        }
        
        let first: Bool
        let last: Bool
        let empty: Bool
    }
}
