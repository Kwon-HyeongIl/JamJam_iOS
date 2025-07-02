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
    let roomId: Int
    var messages: [ChatSocketMessageResponse] = []
    
    var senderId = ""
    
    let user: JJUserModel
    var chatMessage = ""
    
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    
    init(user: JJUserModel, roomId: Int) {
        self.user = user
        self.roomId = roomId
        subscribeStomp()
        ChatManager.shared.connect()
    }
    
    private func subscribeStomp() {
            // 연결 → 방 구독
            ChatManager.shared.socketConnectionStatus
                .sink { [weak self] status in
                    guard let self else { return }
                    if case .connected = status {
                        ChatManager.shared.subscribe(roomId: roomId)
                        print("방 구독")
                    }
                }
                .store(in: &cancellables)

            // 메시지 수신
            ChatManager.shared.onMessageReceived
                .sink { [weak self] new in
                    self?.senderId = new.content.senderId
                    self?.messages.append(new)
                    print("메시지 수신")
                }
                .store(in: &cancellables)
        }
    
    func send() {
        let text = chatMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        ChatManager.shared.sendMessage(roomId: roomId, text: text)
        chatMessage = ""
    }
}
