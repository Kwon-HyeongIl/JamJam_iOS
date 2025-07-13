//
//  ChatViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import SwiftUI
import Combine
import os

@Observable
class ChatListViewModel {
    var chatRooms: [ChatRoomCellDomainModel] = []
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ChatViewModel")
    
    func connectStompChatRoomList() {
        subscribeStompChatRoomList()
        StompManager.connect()
    }
    
    private func subscribeStompChatRoomList() {
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
                    logger.info("[socketConnectionStatusRouter] 연결 상태 확인, 방 목록 구독 시작")
                    StompManager.subscribeChatRoom()
                }
            }
            .store(in: &cancellables)

        // MARK: 채팅방 라우터 구독
        StompCore.shared.chatRoomReceivedRouter
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[chatRoomReceivedRouter] completion finished")
                case .failure(let error):
                    self?.logger.error("[chatRoomReceivedRouter] completion failed: \(error)")
                }
            } receiveValue: { [weak self] chatRoom in
                self?.logger.info("[chatRoomReceivedRouter] 디코딩 된 메시지 저장 시도")
                
                guard let index = self?.chatRooms.firstIndex(where: { $0.roomId == chatRoom.roomId }) else {
                    self?.logger.error("[chatRoomReceivedRouter] 수신한 채팅방과 일치하는 채팅방 없음")
                    return
                }
                
                self?.chatRooms[index] = chatRoom
                
                if index != 0 {
                    withAnimation(.customAnimation) {
                        guard let room = self?.chatRooms.remove(at: index) else {
                            self?.logger.error("[chatRoomReceivedRouter] 채팅방 삭제 실패")
                            return
                        }
                        
                        self?.chatRooms.insert(room, at: 0)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func fetchChatRooms() {
        let request = FetchChatRoomsRequestDto(page: 0, size: 20, sort: ["lastMessageTime,desc"])
        
        ChatManager.fetchChatRooms(request: request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchChatRooms] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchChatRooms] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[fetchChatRooms] SUCCESS")
                    
                    if let rooms = response.content?.rooms {
                        let chatRooms = rooms.map {
                            ChatRoomCellDomainModel(fromFetchChatRoomsResponse: $0)
                        }
                        self?.chatRooms = chatRooms
                    }
                    
                } else {
                    self?.logger.error("[fetchChatRooms] 에러 발생: \(response.message)")
                }
            }
            .store(in: &cancellables)
    }
}
