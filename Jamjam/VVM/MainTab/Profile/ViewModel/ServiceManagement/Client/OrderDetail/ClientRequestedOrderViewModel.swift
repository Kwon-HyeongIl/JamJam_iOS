//
//  ClientRequestedOrderViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation
import Combine
import os

@Observable
class ClientRequestedOrderViewModel {
    var order: OrderDetailDomainModel?
    
    // MARK: 채팅
    var targetRoomId: Int?
    var isNavigateToChatRoom = false
    
    var isEntireProgressViewVisible = false
    
    var isEntireAlertVisible = false
    var entireAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isCancelOrderCompleted = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ClientRequestedOrderViewModel")
    
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
    
    func cancelOrder() {
        guard let orderId = order?.orderId else { return }
        
        let request = CancelOrderRequestDto(
            orderId: orderId,
            orderStatus: .cancelled,
            cancelReason: "")
        
        OrderManager.cancelOrder(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[cancelOrder] finished")
                case .failure(let error):
                    self?.logger.error("[cancelOrder] failed: \(error)")
                    self?.isEntireAlertVisible = true
                }
                
                self?.isEntireProgressViewVisible = false
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[cancelOrder] SUCCESS")
                    self?.isCancelOrderCompleted = true
                    self?.isEntireAlertVisible = true
                    
                } else {
                    self?.logger.error("[cancelOrder] 응답 실패: \(response.message)")
                    self?.entireAlertMessage = response.message
                    self?.isEntireAlertVisible = true
                }
            }
            .store(in: &self.cancellables)
    }
}
