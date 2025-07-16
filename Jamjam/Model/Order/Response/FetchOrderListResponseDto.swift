//
//  FetchOrderListResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import Foundation

struct FetchOrderListResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let orders: [Order]?
        let currentPage: Int
        let totalPages: Int
        let hasNext: Bool
        
        struct Order: Decodable {
            let orderId: Int
            let title: String
            let client: String
            let orderedAt: String
        }
    }
}
