//
//  Message.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import Foundation

struct ChatMessageDomainModel {
    let messageId: Int
    let senderId: String
    let senderNickname: String
    let content: String
    let sentMinuteTime: String
    let sentDate: String
    let isOwn: Bool
    
    init(fromFetchChatMessagesResponse from: FetchChatMessagesResponseDto.Content.Chat) {
        messageId = from.messageId
        senderId = from.senderId
        senderNickname = from.senderNickname
        content = from.content
        sentMinuteTime = DateManager.isoToMinuteTime(from.sentAt)
        sentDate = DateManager.isoToNumDate(from.sentAt)
        isOwn = from.isOwn
    }
    
    init(fromChatSocketMessageResponse from: SocketChatMessageResponseDto.Content) {
        messageId = from.messageId
        senderId = from.senderId
        senderNickname = from.senderNickname
        content = from.content
        sentMinuteTime = DateManager.isoToMinuteTime(from.sentAt)
        sentDate = DateManager.isoToNumDate(from.sentAt)
        isOwn = String(AuthCore.shared.userId ?? -1) == from.senderId ? true : false
    }
}
