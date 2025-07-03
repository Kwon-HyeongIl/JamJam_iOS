//
//  ChatManager+Outer.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

extension ChatManager {
    func connect() {
        guard !client.isConnected else {
            print("ℹ️ 이미 연결됨")
            return
        }
        print("🔌 connect() 호출")
        socketConnectionStatus.send(.connecting)
        client.connect()
    }
    
    func disconnect() {
        guard client.isConnected else { return }
        client.disconnect()
        socketConnectionStatus.send(.disconnected)
    }
    
    // MARK: – Subscribe (방 내부 브로드캐스트)
    func subscribe(roomId: Int) {
        print("📡 subscribe() — roomId: \(roomId)")
        client.subscribe(to: "/topic/room/\(roomId)", mode: .auto)
    }
    
    // MARK: – Send
    func sendMessage(roomId: Int, text: String) {
        let dto = ChatSocketMessageRequest(roomId: roomId, message: text)
        guard let body = try? JSONEncoder().encode(dto),
              let json = String(data: body, encoding: .utf8)
        else {
            print("❗️ 메시지 JSON 인코딩 실패")
            return
        }
        
        print("🚀 SEND ↗️ /app/chat — \(json)")
        client.send(body: json, to: "/app/chat")     // 명세상의 SEND 경로
    }
}
