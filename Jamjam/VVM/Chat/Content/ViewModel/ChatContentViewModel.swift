//
//  ChatContentViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import Foundation
import Combine

@Observable
class ChatContentViewModel {
    let chatRoom: ChatRoom
    var messages: [Message] = []
    
    var chatMessage = ""
    
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
        subscribeStomp()
        ChatManager.shared.connect()
    }
    
    private func subscribeStomp() {
            // 연결 → 방 구독
            ChatManager.shared.socketConnectionStatus
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
                .sink { [weak self] response in
                    guard let message = response.content else { return }
                    self?.messages.append(message)
                    print("메시지 수신")
                }
                .store(in: &cancellables)
        }
    
    func send() {
        let text = chatMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !text.isEmpty else { return }
        
        ChatManager.shared.sendMessage(roomId: chatRoom.id, text: text)
        chatMessage = ""
    }
}
