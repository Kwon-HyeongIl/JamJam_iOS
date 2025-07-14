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
    var provider: ProviderDomainModel?
    
    var isTabBarVisible = true
    var selectedIndex = 0
    let tabBarList = [
        "전문가 정보", "서비스"
    ]
    
    var targetRoomId = 0
    var isNavigateToChatRoom = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ProviderProfileViewModel")
    
    init(userId: Int) {
        fetchProviderProfile(userId: userId)
    }
    
    private func fetchProviderProfile(userId: Int) {
        UserManager.fetchProviderProfile(otherUserId: userId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchProviderProfile] finished")
                case .failure(let error):
                    self?.logger.error("[fetchProviderProfile] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchProviderProfile] SUCCESS")
                    self?.provider = ProviderDomainModel(fromFetchOtherProviderResponseDtoContent: content, userId: userId)
                    
                } else {
                    self?.logger.error("[fetchProviderProfile] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func startChat() {
        guard let targetUserId = provider?.userId else { return }
        
        ChatManager.startChat(otherId: targetUserId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[startChatRoom] finished")
                case .failure(let error):
                    self?.logger.error("[startChatRoom] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let roomId = response.content?.roomId {
                    self?.logger.info("[startChatRoom] SUCCESS")
                    self?.targetRoomId = roomId
                    self?.isNavigateToChatRoom = true
                    
                } else {
                    self?.logger.error("[startChatRoom] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
