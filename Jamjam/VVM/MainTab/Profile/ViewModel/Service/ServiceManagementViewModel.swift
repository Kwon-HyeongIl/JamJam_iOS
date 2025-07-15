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
class ServiceManagementViewModel {
    var segmentedControlList = ["신규 문의", "작업 진행", "작업 완료", "작업 취소"]
    var segmentedControlIndex = 0
    
    var servicePreparingCount = 0
    var serviceCompletedCount = 0
    var serviceCancelledCount = 0
    
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
}
