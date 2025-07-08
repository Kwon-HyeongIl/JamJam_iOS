//
//  ChatSocketRoomListResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/8/25.
//

import Foundation

struct SocketChatRoomResponseDto: Decodable {
    let type: String
    let content: Content?
    
    struct Content: Decodable {
        let id: Int
        let nickname: String
        let lastMessage: String
        let lastMessageTime: String
        let unreadCount: Int
        let profileUrl: String
    }
}
