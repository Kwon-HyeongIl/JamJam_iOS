//
//  FetchChatRoomsResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct FetchChatRoomsResponse: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let rooms: [ChatRoom]
        let currentPage: Int
        let totalPage: Int?
        let hasNext: Bool
    }
}

struct ChatRoom: Decodable, Identifiable, Hashable, Equatable {
    let id: Int
    let nickname: String
    let lastMessage: String?
    let lastMessageTime: String?
    let unreadCount: Int
    let profileUrl: String
}
