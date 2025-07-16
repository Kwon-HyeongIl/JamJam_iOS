//
//  FetchOrderDetailResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/16/25.
//

import Foundation

struct FetchOrderDetailResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let title: String
        let clientId: Int
        let providerId: Int
        let deadLine: String
        let description: String
        let referenceFiles: [ReferenceFile]?
        let cancelReason: String?
        
        struct ReferenceFile: Decodable {
            let id: Int
            let url: String
        }
    }
}
