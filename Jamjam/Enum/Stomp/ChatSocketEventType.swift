//
//  ChatSocketEventType.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

enum ChatSocketEventType: String, Codable {
    // Client → Server
    case sendMessage   = "SEND_MESSAGE"
    case messageRead   = "MESSAGE_READ"
    
    // Server → Client
    case newMessage    = "NEW_MESSAGE"
    case chatRoomUpdate = "CHAT_ROOM_UPDATE"
}
