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
    let chatRoom: ChatRoomDomainModel
    
    var messages: [ChatMessageDomainModel] = []
    
    var inputMessage = ""
    var isEditButtonTapped = false
    var isDeleteChatRoomAlertVisible = false
    var deleteChatRoomAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isChatRoomDeleted = false
    
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ChatContentViewModel")
    
    init(chatRoom: ChatRoomDomainModel) {
        self.chatRoom = chatRoom
        
        fetchChatMessages()
        
        subscribeStompChatRoom()
        StompManager.connect()
    }
    
    private func subscribeStompChatRoom() {
        // MARK: 연결 상태 라우터 구독
        StompCore.shared.socketConnectionStatusRouter
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
                    logger.info("[socketConnectionStatusRouter] 연결 상태 확인, 방 구독 시작, target roomId: \(chatRoom.roomId)")
                    StompManager.subscribeChatRoomMessage(roomId: chatRoom.roomId)
                }
            }
            .store(in: &cancellables)

        // MARK: 메시지 라우터 구독
        StompCore.shared.chatMessageReceivedRouter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[messageReceivedRouter] completion finished")
                case .failure(let error):
                    self?.logger.error("[messageReceivedRouter] completion failed: \(error)")
                }
            } receiveValue: { [weak self] chatMessage in
                self?.logger.info("[messageReceivedRouter] 디코딩 된 메시지 저장 시도")
                self?.messages.append(chatMessage)
            }
            .store(in: &cancellables)
    }
    
    private func fetchChatMessages() {
        let request = FetchChatMessagesRequestDto(page: 0, size: 20, sort: ["lastMessageTime,desc"])
        let chatRoomId = chatRoom.roomId
        
        ChatManager.fetchChatMessages(request: request, chatRoomId: chatRoomId)
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
                    
                    if let chats = response.content?.chats, !chats.isEmpty {
                        self?.logger.info("[fetchChatMessages] 이전 메시지 존재")
                        
                        let chatMessages = chats
                            .map { ChatMessageDomainModel(fromFetchChatMessagesResponse: $0) }
                            .reversed()
                            .reduce(into: []) { $0.append($1) }
                        
                        self?.messages = chatMessages
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
        guard let lastMessageId = messages.last?.messageId else { return }
        let request = ReadLastMessageRequestDto(lastReadMessageId: lastMessageId)
        let chatRoomId = chatRoom.roomId
        
        ChatManager.readLastMessage(request: request, chatRoomId: chatRoomId)
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
        StompManager.sendMessage(roomId: chatRoom.roomId, text: inputMessage)
        
        DispatchQueue.main.async {
            self.inputMessage = ""
        }
    }
    
    func deleteChatRoom() {
        ChatManager.deleteChatRoom(targetChatRoomId: chatRoom.roomId)
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
