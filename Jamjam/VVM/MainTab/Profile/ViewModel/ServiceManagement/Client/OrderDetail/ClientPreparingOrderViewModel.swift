//
//  ClientPreparingOrderViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation
import Combine
import os

@Observable
class ClientPreparingOrderViewModel {
    var order: OrderDetailDomainModel?
    
    // MARK: 채팅
    var targetRoomId: Int?
    var isNavigateToChatRoom = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ClientPreparingOrderViewModel")
    
    init(orderId: Int?) {
        fetchOrderDetail(orderId: orderId)
    }
    
    private func fetchOrderDetail(orderId: Int?) {
        guard let orderId else { return }
        
        let request = FetchOrderDetailRequestDto(orderId: orderId)
        
        OrderManager.fetchOrderDatail(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchOrderDatail] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchOrderDatail] completion failed: \(error)")
                }
                
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchOrderDatail] SUCCESS")
                    
                    var receivedReferencefiles: [OrderReferenceFileDomainModel]?
                    if let referenceFiles = content.referenceFiles {
                        receivedReferencefiles = referenceFiles.map { OrderReferenceFileDomainModel(id: $0.id, url: $0.url) }
                    }
                    
                    let receivedOrderDetail = OrderDetailDomainModel(
                        orderId: orderId,
                        title: content.title,
                        clientId: content.clientId,
                        providerId: content.providerId,
                        deadLine: DateManager.isoToCharDate(content.deadLine),
                        deadLineDday: DateManager.isoToDday(content.deadLine),
                        description: content.description,
                        referenceFiles: receivedReferencefiles,
                        cancelReason: content.cancelReason
                    )
                    
                    self?.order = receivedOrderDetail
                   
                } else {
                    self?.logger.error("[fetchOrderDatail] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func startChat() {
        guard let targetUserId = order?.providerId else { return }
        
        ChatManager.startChat(otherId: targetUserId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[startChat] finished")
                case .failure(let error):
                    self?.logger.error("[startChat] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let roomId = response.content?.roomId {
                    self?.logger.info("[startChat] SUCCESS")
                    self?.targetRoomId = roomId
                    self?.isNavigateToChatRoom = true
                    
                } else {
                    self?.logger.error("[startChat] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
