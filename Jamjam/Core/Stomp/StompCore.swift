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
    var chatRoomReceivedRouter = PassthroughSubject<ChatRoomCellDomainModel, Never>()
    var chatMessageReceivedRouter = PassthroughSubject<ChatMessageDomainModel, Never>()
    
    private struct TypeOnly: Decodable { let type: String }
    
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
    }
    
    private func bindStompEvents() {
            // MARK: Stomp 연결 상태 구독
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
        
        // MARK: Stomp 수신 구독
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
                guard case let .text(raw, _, _, _) = frame,
                      let data = raw.data(using: .utf8) else { return }
                
                guard let typeOnly = try? JSONDecoder().decode(TypeOnly.self, from: data) else {
                    self?.logger.error("[messageUpStream] TypeOnly 디코딩 실패")
                    return
                }
                
                switch typeOnly.type {
                case "CHAT_ROOM_UPDATE":
                    if let dto = try? JSONDecoder().decode(SocketChatRoomResponseDto.self, from: data),
                       let content = dto.content {
                        let chatRoom = ChatRoomCellDomainModel(fromChatSocketRoomResponse: content)
                        self?.chatRoomReceivedRouter.send(chatRoom)
                        
                    } else {
                        self?.logger.error("[messagesUpstream] ChatSocketRoomResponseDto 디코딩 실패")
                    }
                    
                case "NEW_MESSAGE":
                    if let dto = try? JSONDecoder().decode(SocketChatMessageResponseDto.self, from: data),
                       let content = dto.content {
                        let message = ChatMessageDomainModel(fromChatSocketMessageResponse: content)
                        self?.chatMessageReceivedRouter.send(message)
                        
                    } else {
                        self?.logger.error("[messagesUpstream] ChatSocketMessageResponseDto 디코딩 실패")
                    }
                    
                default:
                    self?.logger.warning("[messagesUpstream] 미확인 type: \(typeOnly.type)")
                }
            }
            .store(in: &self.cancellables)
    }
}
