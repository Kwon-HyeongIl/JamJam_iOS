//
//  ChatSocketMessageRequest.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct ChatSocketMessageRequestDto: Encodable {
    let type: ChatSocketEventType = .sendMessage
    let content: Content

    struct Content: Encodable {
        let roomId: Int
        let message: String
    }

    init(roomId: Int, message: String) {
        self.content = .init(roomId: roomId, message: message)
    }
}
