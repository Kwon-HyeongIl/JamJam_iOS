//
//  SearchViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/13/25.
//

import SwiftUI
import Combine
import os

@Observable
class SearchServiceViewModel {
    var services: [ServiceCellDomainModel] = []
    
    var searchText = ""
    var isSearchButtonTapped = false
    
    var currentPage = 0
    var hasNextPage = true
    
    var isEntireProgressVisible = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "SearchServiceViewModel")
    
    @ObservationIgnored let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: .top),
        GridItem(.flexible(), spacing: 0, alignment: .top)
    ]
    
    func restoreServices() {
        services = []
        currentPage = 0
        hasNextPage = true
    }
    
    func searchService() {
        guard hasNextPage else { return }
        
        let request = SearchServiceRequestDto(
            keyword: searchText,
            page: currentPage,
            size: 20,
            sort: []
        )
        
        currentPage += 1
        
        ServiceManager.searchService(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[searchService] completion finished")
                case .failure(let error):
                    self?.logger.error("[searchService] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[searchService] SUCCESS")
                    
                    if let services = content.services {
                        let newServices = services.map { service in
                            ServiceCellDomainModel(
                                serviceId: service.serviceId,
                                thumbnailUrl: service.thumbnailUrl,
                                serviceName: service.serviceName,
                                providerName: service.providerName,
                                salary: service.salary
                            )
                        }
                        
                        self?.services.append(contentsOf: newServices)
                        
                    } else {
                        self?.logger.error("[searchService] service nil")
                    }
                    
                    self?.hasNextPage = content.hasNext
                    
                } else {
                    self?.logger.error("[fetchServices] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
