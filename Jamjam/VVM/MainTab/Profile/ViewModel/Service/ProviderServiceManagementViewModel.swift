//
//  ServiceManagementViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import Foundation
import Combine
import os

@Observable
class ProviderServiceManagementViewModel {
    var segmentedControlList = ["신규 문의", "작업 진행", "작업 완료", "작업 취소"]
    var segmentedControlIndex = 0
    
    var servicePreparingCount = 0
    var serviceCompletedCount = 0
    var serviceCancelledCount = 0
    
    var orders: [OrderCellDomainModel] = []
    
    var currentPage = 0
    var hasNextPage = true
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ServiceManagementViewModel")
    
    init() {
        fetchOrderStateCounts()
    }
    
    func fetchOrderStateCounts() {
        OrderManager.fetchOrderStateCounts()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchOrderStateCounts] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchOrderStateCounts] completion failed: \(error)")
                }
                
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchOrderStateCounts] SUCCESS")
                    
                    self?.servicePreparingCount = content.preparing
                    self?.serviceCompletedCount = content.completed
                    self?.serviceCancelledCount = content.cancelled
             
                } else {
                    self?.logger.error("[fetchOrderStateCounts] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func restoreOrders() {
        orders = []
        currentPage = 0
        hasNextPage = true
    }
    
    func fetchOrders() {
        guard hasNextPage else { return }
        
        var orderState: OrderState
        switch segmentedControlIndex {
        case 0:
            orderState = .requested
        case 1:
            orderState = .preparing
        case 2:
            orderState = .completed
        case 3:
            orderState = .cancelled
        default:
            return
        }
        
        let request = FetchOrderListRequestDto(
            orderStatus: orderState,
            page: currentPage,
            size: 20,
            sort: []
        )
        
        currentPage += 1
        
        OrderManager.fetchOrderList(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchOrderList] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchOrderList] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchOrderList] SUCCESS")
                    
                    if let orders = content.orders {
                        let newOrders = orders.map { order in
                            OrderCellDomainModel(
                                orderId: order.orderId,
                                title: order.title,
                                client: order.client,
                                orderedAt: DateManager.isoToMonthDay(order.orderedAt)
                            )
                        }
                        
                        self?.orders.append(contentsOf: newOrders)
                        
                    } else {
                        self?.logger.error("[fetchOrderList] service nil")
                    }
                    
                    self?.hasNextPage = content.hasNext
                    
                } else {
                    self?.logger.error("[fetchOrderList] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
