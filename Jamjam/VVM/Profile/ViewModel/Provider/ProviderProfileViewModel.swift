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
    var otherProvider: ProviderDomainModel?
    
    var isTabBarVisible = true
    var selectedIndex = 0
    let tabBarList = [
        "전문가 정보", "서비스"
    ]
    
    var targetRoomId = 0
    var isNavigateToChatRoom = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ProviderProfileViewModel")
    
    init(otherUserId: Int) {
        fetchOtherProvider(otherUserId: otherUserId)
    }
    
    private func fetchOtherProvider(otherUserId: Int) {
        UserManager.fetchOtherProvider(otherUserId: otherUserId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchOtherProvider] finished")
                case .failure(let error):
                    self?.logger.error("[fetchOtherProvider] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchOtherProvider] SUCCESS")
                    self?.otherProvider = ProviderDomainModel(fromFetchOtherProviderResponseDtoContent: content, userId: otherUserId)
                    
                } else {
                    self?.logger.error("[fetchOtherProvider] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func startChatRoom() {
        guard let targetUserId = otherProvider?.userId else { return }
        
        ChatManager.startChatRoom(otherId: targetUserId)
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
