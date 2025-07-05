//
//  Message.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import Foundation

struct ChatMessageModel {
    let messageId: Int
    let senderId: String
    let senderNickname: String
    let content: String
    let sentAt: String
    let isOwn: Bool
    
    init(fromFetchChatMessagesResponse from: FetchChatMessagesResponse.Content.Chat) {
        messageId = from.messageId
        senderId = from.senderId
        senderNickname = from.senderNickname
        content = from.content
        sentAt = from.sentAt
        isOwn = from.isOwn
    }
    
    init(fromChatSocketMessageResponse from: ChatSocketMessageResponse.Content) {
        messageId = from.messageId
        senderId = from.senderId
        senderNickname = from.senderNickname
        content = from.content
        sentAt = from.sentAt
        isOwn = from.isOwn
    }
}
