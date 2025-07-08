//
//  StompManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/8/25.
//

import Foundation
import os

class StompManager {
    private static let logger = Logger(subsystem: "com.khi.jamjam", category: "StompManager")
    
    static func connect() {
        guard !(StompCore.shared.client?.isConnected == true) else { return }

        StompCore.shared.socketConnectionStatusRouter.send(.connecting)
        StompCore.shared.client?.connect()
    }
    
    static func disconnect() {
        guard StompCore.shared.client?.isConnected == true else { return }
        
        StompCore.shared.client?.disconnect()
        StompCore.shared.socketConnectionStatusRouter.send(.disconnected)
    }
    
    static func subscribeChatRoomMessage(roomId: Int) {
        StompCore.shared.client?.subscribe(to: "/topic/room/\(roomId)", mode: .auto, headers: API.socketHeaders)
    }
    
    static func subscribeChatRoom() {
        guard let userId = AuthCore.shared.userId else {
            logger.error("[subscribeChatRoomList] userId nil")
            return
        }
        
        StompCore.shared.client?.subscribe(to: "/topic/user-room-updates/\(userId)", mode: .auto, headers: API.socketHeaders)
    }
    
    static func sendMessage(roomId: Int, text: String) {
        let dto = SocketChatMessageRequestDto(roomId: roomId, message: text)
        guard let body = try? JSONEncoder().encode(dto),
              let json = String(data: body, encoding: .utf8)
        else {
            logger.error("[sendMesssage] 디코딩 실패")
            return
        }
        
        StompCore.shared.client?.send(body: json, to: "/app/chat", headers: API.socketHeaders)
    }
}
