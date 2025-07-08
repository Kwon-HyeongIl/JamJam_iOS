//
//  WriteViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import SwiftUI
import Combine
import os

@Observable
class RegisterServiceViewModel: Hashable, Equatable {
    var pageIndex = 2
    
    // MARK: Page Index 0
    var initialDescription = ""
    var isAiGenerateContentsProgressViewVisible = false
    var isInitialContentsGenerateCompleted = false
    
    // MARK: Page Index 1
    var serviceName = ""
    var aiRecommendServiceNames: [String] = ["fadkfjads", "akdjfakd"]
    var category: Skill?
    var description = ""
    var price = ""
    var isAllValidatedInPageIndex1: Bool {
        !serviceName.isEmpty && category != nil && !description.isEmpty && !price.isEmpty
    }
    
    // MARK: Page Index 2
    var isAiGenerateImageProgressViewVisible = false
    var typography = true
    var thumbnailImage: UIImage?
    var portfolioImages: [UIImage]?
    var isAllValidatedInPageIndex2: Bool {
        true
    }
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "RegisterServiceViewModel")
    
    func generateService() {
        let request = GenerateServiceRequestDto(discription: initialDescription)
        
        ServiceManager.generateService(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[generateService] completion finished")
                case .failure(let error):
                    self?.logger.error("[generateService] completion failed: \(error)")
                }
                
                self?.isAiGenerateContentsProgressViewVisible = false
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[generateService] SUCCESS")
                    
                    self?.aiRecommendServiceNames = content.serviceNames
                    self?.category = Skill(rawValue: content.category)
                    self?.description = content.description
                    self?.pageIndex = 1
                    self?.isInitialContentsGenerateCompleted = true
                    
                } else {
                    self?.logger.error("[generateService] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func generateThumbnail() {
        let request = GenerateThumbnailRequestDto(serviceName: serviceName, description: description, typography: typography)
        
        ServiceManager.generateThumbnail(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[generateThumbnail] completion finished")
                case .failure(let error):
                    self?.logger.error("[generateThumbnail] completion failed: \(error)")
                }
                
                self?.isAiGenerateImageProgressViewVisible = false
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[generateThumbnail] SUCCESS")
                    
                    let convertedImage = self?.decodeImage(content.imageBase64)
                    self?.thumbnailImage = convertedImage
                    
                } else {
                    self?.logger.error("[generateThumbnail] 응답 처리 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
    
    private func decodeImage(_ base64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64String),
              let image = UIImage(data: imageData) else {
            logger.error("[decodeImage] Base64 디코딩 또는 UIImage 생성 실패")
            return nil
        }
        
        return image
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
