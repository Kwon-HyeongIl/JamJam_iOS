//
//  StompCore.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation
import Combine
import Alamofire
import SwiftStomp
import os

@Observable
class StompCore {
    static let shared = StompCore()
    
    var client: SwiftStomp?
    
    var socketConnectionStatusRouter = CurrentValueSubject<SocketConnectionStatus, Never>(.disconnected)
    var messageReceivedRouter = PassthroughSubject<ChatMessageDomainModel, Never>()
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ChatManager")
   
    func initStompClient() {
        logger.info("[initStompClient] STOMP client 초기화")
        
        let url = API.webSocketURL.url
        let headers = API.socketHeaders
        
        client = SwiftStomp(host: url, headers: headers, httpConnectionHeaders: headers)
        client?.autoReconnect = true
        client?.enableAutoPing()
        client?.enableLogging = true
        
        bindStompEvents()
        
        AuthCore.shared.isStompClientInit = true
    }
    
    private func bindStompEvents() {
            // MARK: STOMP 연결 상태 구독
            client?.eventsUpstream
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.logger.info("[eventsUpstream] completion finished")
                    case .failure(let error):
                        self?.logger.error("[eventsUpstream] completion failed: \(error)")
                    }
                } receiveValue: { [weak self] event in
                    switch event {
                    case .connected:
                        self?.logger.info("[eventsUpstream] STOMP connected")
                        self?.socketConnectionStatusRouter.send(.connected)
                    case .disconnected:
                        self?.logger.info("[eventsUpstream] STOMP disconnected")
                        self?.socketConnectionStatusRouter.send(.disconnected)
                    case .error(let error):
                        self?.logger.info("[eventsUpstream] STOMP error: \(error)")
                        self?.socketConnectionStatusRouter.send(.disconnected)
                    }
                }
                .store(in: &cancellables)

            // MARK: STOMP 메시지 수신 구독
            client?.messagesUpstream
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.logger.info("[messagesUpstream] completion finished")
                    case .failure(let error):
                        self?.logger.error("[messagesUpstream] completion failed: \(error)")
                    }
                } receiveValue: { [weak self] frame in
                    guard case let
                        .text(raw, _, _, _) = frame,
                          let data = raw.data(using: .utf8),
                          let response = try? JSONDecoder().decode(ChatSocketMessageResponseDto.self, from: data),
                          let content = response.content
                    else {
                        self?.logger.error("[messagesUpstream] 수신 프레임 디코딩 실패")
                        return
                    }
                    
                    let chatMessage = ChatMessageDomainModel(fromChatSocketMessageResponse: content)
                    
                    self?.logger.info("[messagesUpstream] 수신 프레임 디코딩 성공, senderId: \(chatMessage.senderId)")
                    
                    self?.messageReceivedRouter.send(chatMessage)
                }
                .store(in: &self.cancellables)
        }
}
