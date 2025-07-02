//
//  TestViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/24/25.
//

import Foundation
import Combine

@Observable
class TestViewModel {
    let roomId: Int
    var inputText: String = ""
    var messages: [ChatSocketMessageResponse] = []
    
    var senderId = ""
    
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    
    init(roomId: Int) {
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
            let text = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !text.isEmpty else { return }
            ChatManager.shared.sendMessage(roomId: roomId, text: text)
            inputText = ""
        }
}
