//
//  CategoryViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/20/25.
//

import SwiftUI
import Combine
import os

@Observable
class CategoryViewModel {
    var selectedSkill: SkillCategory?
    
    var services: [ServiceCellDomainModel] = []
    
    var currentPage = 0
    var hasNextPage = true
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "CategoryViewModel")
    
    @ObservationIgnored let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: .top),
        GridItem(.flexible(), spacing: 0, alignment: .top)
    ]
    
    init(skill: SkillCategory) {
        selectedSkill = skill
    }
    
    func restoreServices() {
        services = []
        currentPage = 0
        hasNextPage = true
    }
    
    func fetchServiceWithCategory() {
        guard hasNextPage else { return }
        
        guard let category = selectedSkill?.rawValue else { return }
        
        let request = FetchServicesRequestDto(
            category: category,
            page: currentPage,
            size: 20,
            sort: []
        )
        
        currentPage += 1
        
        ServiceManager.fetchServices(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchServices] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchServices] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchServices] SUCCESS")
                    
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
                        self?.logger.error("[fetchServices] service nil")
                    }
                    
                    self?.hasNextPage = content.hasNext
                    
                } else {
                    self?.logger.error("[fetchServices] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
