//
//  ChatSocketMessageResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct ChatSocketMessageResponseDto: Decodable {
    let type: String
    let content: Content?
    
    struct Content: Decodable {
        let messageId: Int
        let senderId: String
        let senderNickname: String
        let content: String
        let sentAt: String
    }
}
