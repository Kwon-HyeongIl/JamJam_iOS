//
//  ProviderProfileViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/30/25.
//

import Foundation
import Combine
import os

@Observable
class ProviderProfileViewModel {
    let user = JJUserModel(userId: "1", realName: "llioopv") // 임시
    
    var isTabBarVisible = true
    var selectedIndex = 0
    let tabBarList = [
        "전문가 정보", "서비스"
    ]
    
    var isChatAlertVisible = false
    var chatAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var targetRoomId = 0
    var isNavigateToChatRoom = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ProviderProfileViewModel")
    
    func startChatRoom() {
        ChatManager.startChatRoom(otherId: "1")
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[startChatRoom] finished")
                case .failure(let error):
                    self?.logger.error("[startChatRoom] failed: \(error)")
                    self?.isChatAlertVisible = true
                }
            } receiveValue: { [weak self] response in
                let receivedRoomId = response.content?.roomId ?? 0
                
                if response.code == "SUCCESS", receivedRoomId != 0 {
                    self?.logger.info("[startChatRoom] SUCCESS")
                    self?.targetRoomId = receivedRoomId
                    self?.isNavigateToChatRoom = true
                    
                } else {
                    self?.isChatAlertVisible = true
                    self?.chatAlertMessage = response.message
                }
            }
            .store(in: &self.cancellables)
    }
}
