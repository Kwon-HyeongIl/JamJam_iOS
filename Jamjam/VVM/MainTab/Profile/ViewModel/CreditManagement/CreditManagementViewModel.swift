//
//  ProviderFinanceManagementViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import Foundation
import Combine
import os

@Observable
class CreditManagementViewModel {
    var creditHistorys: [CreditHistoryCellDomainModel] = []
    
    var creditHistorySegmentedControl: CreditHistoryType = .all
    
    var currentPage = 0
    var hasNextPage = true
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "CreditManagementViewModel")
    
    func restoreHistories() {
        creditHistorys = []
        currentPage = 0
        hasNextPage = true
    }
    
    func fetchCreditHistorys() {
        guard hasNextPage else { return }
        
        let request = FetchCreditHistorysRequestDto(
            type: creditHistorySegmentedControl,
            page: currentPage,
            size: 20,
            sort: []
        )
        
        currentPage += 1
        
        CreditManager.fetchCreditHistorys(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchCreditHistorys] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchCreditHistorys] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchCreditHistorys] SUCCESS")
                    
                    if let histories = content.histories {
                        let newHistories = histories.map { history in
                            CreditHistoryCellDomainModel(
                                historyId: history.historyId,
                                amount: history.amount,
                                reason: history.reason,
                                createdAt: DateManager.isoToNumDate(history.createdAt)
                            )
                        }
                        
                        self?.creditHistorys.append(contentsOf: newHistories)
                        
                    } else {
                        self?.logger.error("[fetchCreditHistoryss] service nil")
                    }
                    
                    self?.hasNextPage = content.hasNext
                    
                } else {
                    self?.logger.error("[fetchCreditHistorys] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
