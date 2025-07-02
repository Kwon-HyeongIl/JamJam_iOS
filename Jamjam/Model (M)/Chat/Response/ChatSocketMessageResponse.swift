//
//  ChatSocketMessageResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct ChatSocketMessageResponse: Codable, Identifiable {
    let type: ChatSocketEventType
    let content: Content

    struct Content: Codable, Identifiable {
        let messageId: Int
        let senderId: String
        let senderNickname: String
        let content: String
        let sentAt: Date              // ISO-8601
        var id: Int { messageId }
    }

    // Identifiable proxy
    var id: Int { content.messageId }
}
