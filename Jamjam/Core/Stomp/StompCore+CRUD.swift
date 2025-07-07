//
//  StompCore+CRUD.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation

extension StompCore {
    func connect() {
        guard !(client?.isConnected == true) else { return }

        socketConnectionStatusRouter.send(.connecting)
        client?.connect()
    }
    
    func disconnect() {
        guard client?.isConnected == true else { return }
        
        client?.disconnect()
        socketConnectionStatusRouter.send(.disconnected)
    }
    
    func subscribe(roomId: Int) {
        let headers = API.socketHeaders
        client?.subscribe(to: "/topic/room/\(roomId)", mode: .auto, headers: headers)
    }
    
    func sendMessage(roomId: Int, text: String) {
        let dto = ChatSocketMessageRequestDto(roomId: roomId, message: text)
        guard let body = try? JSONEncoder().encode(dto),
              let json = String(data: body, encoding: .utf8)
        else {
            self.logger.info("[sendMessage] 인코딩 실패")
            return
        }
        
        let headers = API.socketHeaders
        client?.send(body: json, to: "/app/chat", headers: headers)
    }
}
