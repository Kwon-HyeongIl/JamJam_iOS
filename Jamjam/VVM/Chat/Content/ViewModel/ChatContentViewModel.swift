//
//  ChatContentViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import Foundation
import Combine
import os

@Observable
class ChatContentViewModel {
    let chatRoom: ChatRoom
    
    var messages: [Message] = []
    
    var inputMessage = ""
    
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ChatContentViewModel")
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
        
        fetchChatMessages()
        
        subscribeStomp()
        ChatManager.shared.connect()
    }
    
    private func subscribeStomp() {
        // 연결 → 방 구독
        ChatManager.shared.socketConnectionStatus
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                guard let self else { return }
                if case .connected = status {
                    ChatManager.shared.subscribe(roomId: chatRoom.id)
                    print("방 구독")
                }
            }
            .store(in: &cancellables)

        // 메시지 수신
        ChatManager.shared.onMessageReceived
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                guard let message = response.content else { return }
                self?.messages.append(message)
                print("메시지 수신")
            }
            .store(in: &cancellables)
    }
    
    private func fetchChatMessages() {
        let request = FetchChatMessagesRequest(page: 0, size: 20, sort: ["lastMessageTime,desc"])
        let chatRoomId = chatRoom.id
        
        ChatManager.shared.fetchChatMessages(request: request, chatRoomId: chatRoomId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchChatMessages] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchChatMessages] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[fetchChatMessages] SUCCESS")
                    
                    if let messages = response.content?.chats {
                        self?.logger.info("[fetchChatMessages] 이전 메세지 존재")
                        self?.messages = messages
                    }
                    
                } else {
                    self?.logger.error("[fetchChatMessages] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func send() {
        let text = inputMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !text.isEmpty else { return }
        
        ChatManager.shared.sendMessage(roomId: chatRoom.id, text: text)
        inputMessage = ""
    }
}
