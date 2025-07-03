//
//  ChatSocketMessageResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct ChatSocketMessageResponse: Codable {
    let type: ChatSocketEventType
    let content: Message?
}

struct Message: Codable, Identifiable {
    let messageId: Int
    let senderId: String
    let senderNickname: String
    let content: String
    let sentAt: Date // ISO-8601
    let isOwn: Bool
    
    // Idenrifiable
    var id: Int { messageId }
}
