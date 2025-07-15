//
//  FetchOrderStateCountsResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import Foundation

struct FetchOrderStateCountsResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let preparing: Int
        let completed: Int
        let cancelled: Int
    }
}
