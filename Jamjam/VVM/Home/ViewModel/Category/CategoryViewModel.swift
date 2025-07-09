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
    var selectedSkill: Skill?
    
    var services: [ServiceCellDomainModel] = []
    
    var currentPage = 0
    var totalPage = 0
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "CategoryViewModel")
    
    @ObservationIgnored let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: .top),
        GridItem(.flexible(), spacing: 0, alignment: .top)
    ]
    
    init(skill: Skill) {
        selectedSkill = skill
        fetchServiceWithCategory()
    }
    
    func restoreServices() {
        services = []
        currentPage = 0
        totalPage = 0
    }
    
    func fetchServiceWithCategory() {
        guard let category = selectedSkill?.rawValue else { return }
        
        if currentPage != 0 {
            guard currentPage < totalPage else { return }
        }
        
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
                if response.code == "SUCCESS" {
                    self?.logger.info("[fetchServices] SUCCESS")
                    
                    if let inContent = response.content?.content {
                        let newServices = inContent.map { service in
                            ServiceCellDomainModel(thumbnailUrl: service.thumbnailUrl, serviceName: service.serviceName, providerName: service.providerName, salary: service.salary)
                        }
                        
                        self?.services.append(contentsOf: newServices)
                    }
                    
                    if let totalPages = response.content?.totalPages {
                        self?.totalPage = totalPages
                    }
                    
                } else {
                    self?.logger.error("[fetchServices] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
