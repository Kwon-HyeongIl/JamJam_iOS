//
//  FetchCreditHistoryResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation

struct FetchCreditHistorysResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let histories: [History]?
        let currentPage: Int
        let totalPages: Int
        let hasNext: Bool
        
        struct History: Decodable {
            let historyId: Int
            let amount: Int
            let reason: String
            let createdAt: String
        }
    }
}
