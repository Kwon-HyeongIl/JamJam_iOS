//
//  FetchChatMessagesResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/3/25.
//

import Foundation

struct FetchChatMessagesResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let sliceInfo: SliceInfo
        let chats: [Chat]
        
        struct SliceInfo: Decodable {
            let hasNext: Bool
        }
        
        struct Chat: Decodable {
            let messageId: Int
            let senderId: String
            let senderNickname: String
            let content: String
            let sentAt: String
            let isOwn: Bool
        }
    }
}
