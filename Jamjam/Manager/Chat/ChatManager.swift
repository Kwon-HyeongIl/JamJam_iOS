//
//  ChatManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation
import Combine
import Alamofire
import SwiftStomp

class ChatManager {
    static let shared = ChatManager()
    
    var client: SwiftStomp!
    
    var socketConnectionStatus = CurrentValueSubject<SocketConnectionStatus, Never>(.disconnected)
    var onMessageReceived = PassthroughSubject<ChatSocketMessageResponse, Never>()
    let decoder: JSONDecoder
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        let url = API.webSocketURL.url
        let headers = API.socketHeaders
        
        client = SwiftStomp(host: url, headers: headers, httpConnectionHeaders: headers)
        client.autoReconnect = true
        client.enableAutoPing()
        
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        print("🟢 ChatManager init 완료 — URL: \(url)")
        
        bindStompEvents()
    }
    
    private func bindStompEvents() {
            // 연결 상태 수신
            client.eventsUpstream
                .receive(on: DispatchQueue.main)
                .sink { [weak self] event in
                    switch event {
                    case .connected:
                        print("✅ STOMP connected")
                        self?.socketConnectionStatus.send(.connected)
                    case .disconnected:
                        print("⚠️ STOMP disconnected")
                        self?.socketConnectionStatus.send(.disconnected)
                    case .error(let e):
                        print("❌ STOMP Error: \(e)")
                        self?.socketConnectionStatus.send(.disconnected)
                    }
                }
                .store(in: &cancellables)

            // 메시지 수신
            client.messagesUpstream
                .receive(on: DispatchQueue.main)
                .sink { [weak self] frame in
                    guard case let .text(raw, _, _, _) = frame,
                          let data = raw.data(using: .utf8),
                          let res  = try? self?.decoder.decode(ChatSocketMessageResponse.self, from: data),
                          res.type == .newMessage
                    else {
                        print("🟤 수신 프레임 디코딩 실패: \(frame)")
                        return
                    }
                    print("💬 수신: \(res)")
                    
                    self?.onMessageReceived.send(res)
                }
                .store(in: &cancellables)
        }
}
