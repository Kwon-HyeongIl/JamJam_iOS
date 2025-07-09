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
    
    func fetchServiceWithCategory() {
        let request = FetchServicesRequestDto(
            category: selectedSkill?.rawValue ?? 1,
            page: 0,
            size: 20,
            sort: []
        )
        
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
                    
                } else {
                    self?.logger.error("[fetchServices] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
