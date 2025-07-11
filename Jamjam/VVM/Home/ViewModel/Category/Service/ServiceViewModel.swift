//
//  ServiceContentViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import Foundation
import Combine
import os

@Observable
class ServiceViewModel {
    var service: ServiceDomainModel?
    
    var selectedIndex = 0
    let tabBarList = [
        "서비스 정보", "포트폴리오"
    ]
    var isTabBarVisible = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ServiceContentViewModel")
    
    init(serviceId: Int) {
        fetchService(serviceId: serviceId)
    }
    
    private func fetchService(serviceId: Int) {
        let request = FetchServiceRequestDto(serviceId: serviceId)
        
        ServiceManager.fetchService(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchService] completion finished")
                case .failure(let error):
                    self?.logger.error("[fetchService] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchService] completion finished")
                    
                    let portfolioImages: [PortfolioImageDomainModel]? = content
                        .portfolioImages?
                        .map { image in
                            PortfolioImageDomainModel(imageId: image.id, url: image.url)
                        }
                    
                    let service = ServiceDomainModel(
                        userId: content.userId,
                        nickname: content.nickName,
                        profileUrl: content.profileUrl,
                        location: content.location,
                        serviceId: content.serviceId,
                        thumbnailUrl: content.thumbnail,
                        portfolioImages: portfolioImages,
                        serviceName: content.serviceName,
                        description: content.description,
                        salary: content.salary,
                        category: content.category
                    )
                    
                    self?.service = service
                    
                } else {
                    self?.logger.error("[fetchService] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
