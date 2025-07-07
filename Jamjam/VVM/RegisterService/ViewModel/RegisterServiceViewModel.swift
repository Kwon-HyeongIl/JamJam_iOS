//
//  WriteViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation
import Combine
import os

@Observable
class RegisterServiceViewModel: Hashable, Equatable {
    var pageIndex = 1
    
    // MARK: Page Index 0
    var inputInitialDiscription = ""
    var isAiProgressiveViewVisible = false
    var isInitialContentsGenerateCompleted = false
    
    // MARK: Page Index 1
    var aiServiceNames: [String] = []
    var category: Skill?
    var discription = ""
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "RegisterServiceViewModel")
    
    func generateService() {
        let request = GenerateServiceRequestDto(discription: inputInitialDiscription)
        
        ServiceManager.generateService(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[generateService] completion finished")
                case .failure(let error):
                    self?.logger.error("[generateService] completion failed: \(error)")
                }
                
                self?.isAiProgressiveViewVisible = false
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[generateService] SUCCESS")
                    self?.category = Skill(rawValue: content.category)
                    self?.discription = content.discription
                    self?.pageIndex = 1
                    self?.isInitialContentsGenerateCompleted = true
                    
                } else {
                    self?.logger.error("[generateService] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    
    // MARK: Hashble, Equatable
    let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RegisterServiceViewModel, rhs: RegisterServiceViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
