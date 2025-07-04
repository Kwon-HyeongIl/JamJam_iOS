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
    var isEditButtonTapped = false
    var isDeleteChatRoomAlertVisible = false
    var deleteChatRoomAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isChatRoomDeleted = false
    
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ChatContentViewModel")
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
        
        fetchChatMessages()
        
        subscribeStomp()
        ChatManager.shared.connect()
    }
    
    private func subscribeStomp() {
        // MARK: 연결 상태 라우터 구독 → 방 구독 (connection 상태일 때)
        ChatManager.shared.socketConnectionStatusRouter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[socketConnectionStatusRouter] completion finished")
                case .failure(let error):
                    self?.logger.error("[socketConnectionStatusRouter] completion failed: \(error)")
                }
            } receiveValue: { [weak self] status in
                guard let self else { return }
                
                if case .connected = status {
                    logger.info("[socketConnectionStatusRouter] 연결 상태 확인, 방 구독 시작, target roomId: \(chatRoom.id)")
                    ChatManager.shared.subscribe(roomId: chatRoom.id)
                }
            }
            .store(in: &cancellables)

        // MARK: 메시지 라우터 구독
        ChatManager.shared.messageReceivedRouter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[messageReceivedRouter] completion finished")
                case .failure(let error):
                    self?.logger.error("[messageReceivedRouter] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                self?.logger.info("[messageReceivedRouter] 디코딩 된 메시지 저장")
                guard let message = response.content else { return }
                self?.messages.append(message)
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
                    
                    if let messages = response.content?.chats, !messages.isEmpty {
                        self?.logger.info("[fetchChatMessages] 이전 메시지 존재")
                        self?.messages = messages
                        self?.readLastMessage()
                        
                    } else {
                        self?.logger.info("[fetchChatMessages] 이전 메시지 없음")
                    }
                    
                } else {
                    self?.logger.error("[fetchChatMessages] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func readLastMessage() {
        let lastMessageId = messages.last?.id ?? 0
        let request = ReadLastMessageRequest(lastReadMessageId: lastMessageId)
        let chatRoomId = chatRoom.id
        
        ChatManager.shared.readLastMessage(request: request, chatRoomId: chatRoomId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[readLastMessage] completion finished")
                case .failure(let error):
                    self?.logger.error("[readLastMessage] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[readLastMessage] SUCCESS")
                    
                } else {
                    self?.logger.error("[readLastMessage] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func send() {
        ChatManager.shared.sendMessage(roomId: chatRoom.id, text: inputMessage)
        inputMessage = ""
    }
    
    func deleteChatRoom() {
        ChatManager.shared.deleteChatRoom(targetChatRoomId: chatRoom.id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[deleteChatRoom] completion finished")
                case .failure(let error):
                    self?.logger.error("[deleteChatRoom] completion failed: \(error)")
                    self?.isDeleteChatRoomAlertVisible = true
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[deleteChatRoom] SUCCESS")
                    self?.isChatRoomDeleted = true
                    
                } else {
                    self?.logger.error("[deleteChatRoom] 응답 처리 실패: \(response.message)")
                    self?.isDeleteChatRoomAlertVisible = true
                    self?.deleteChatRoomAlertMessage = response.message
                }
            }
            .store(in: &self.cancellables)
    }
}
