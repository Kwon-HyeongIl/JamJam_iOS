//
//  ChatRoom.swift
//  Jamjam
//
//  Created by 권형일 on 7/5/25.
//

import Foundation

struct ChatRoomModel: Hashable, Equatable {
    let roomId: Int
    let nickname: String
    let lastMessage: String
    let lastMessageRelativeTime: String
    let unreadCount: Int
    let profileUrl: String
    
    init(fromFetchChatRoomsResponse from: FetchChatRoomsResponse.Content.Room) {
        roomId = from.id
        nickname = from.nickname ?? ""
        lastMessage = from.lastMessage ?? ""
        lastMessageRelativeTime = DateManager.isoToRelativeTime(from.lastMessageTime)
        unreadCount = from.unreadCount
        profileUrl = from.profileUrl ?? ""
    }
}
