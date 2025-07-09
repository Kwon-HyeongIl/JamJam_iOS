//
//  WriteViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import SwiftUI
import Combine
import PhotosUI
import os

@Observable
class RegisterServiceViewModel: Hashable, Equatable {
    var pageIndex = 0
    
    // MARK: Page Index 0
    var initialDescription = ""
    var isAiGenerateContentsProgressViewVisible = false
    var isInitialContentsGenerateCompleted = false
    
    // MARK: Page Index 1
    var serviceName = ""
    var aiRecommendServiceNames: [String] = ["fadkfjads", "akdjfakd"]
    var category: Skill?
    var description = ""
    var salary = ""
    var isAllValidatedInPageIndex1: Bool {
        !serviceName.isEmpty && category != nil && !description.isEmpty && !salary.isEmpty
    }
    
    // MARK: Page Index 2
    var isAiGenerateImageProgressViewVisible = false
    var typography = true
    var selectedThumbnailImage: PhotosPickerItem?
    var thumbnailImage: UIImage?
    var isPortfolioPhotosPickerVisible = false
    var selectedPortfolioImages: [PhotosPickerItem] = []
    var portfolioImages: [UIImage]?
    var isAllValidatedInPageIndex2: Bool {
        true
    }
    
    // MARK: Complete
    var isEntireProgressViewVisible = false
    var isRegisterCompleted = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "RegisterServiceViewModel")
    
    func generateService() {
        let request = GenerateServiceRequestDto(description: initialDescription)
        
        print("initialDescription \(initialDescription)")
        logger.info("[generateService] 요청 송신")
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
    
    func convertThumbnailImage() async {
        guard let item = selectedThumbnailImage else { return }
        
        if let data = try? await item.loadTransferable(type: Data.self),
           let uiImage = UIImage(data: data) {
            await MainActor.run {
                self.thumbnailImage = uiImage
            }
        }
    }
    
    func convertPortfolioImages() async {
        var uiImages: [UIImage] = []
        
        for item in selectedPortfolioImages {
            if let data = try? await item.loadTransferable(type: Data.self),
               let img = UIImage(data: data) {
                uiImages.append(img)
            }
        }
        
        let covertedUiImages = uiImages
        await MainActor.run {
            self.portfolioImages = covertedUiImages
        }
    }
    
    func generateThumbnail() {
        let request = GenerateThumbnailRequestDto(serviceName: serviceName, description: description, typography: typography)
        
        logger.info("[generateThumbnail] 요청 송신")
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
        let body = base64String
            .components(separatedBy: ",")
            .last ?? base64String
        
        let standard = body
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
            .replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
        
        guard let data = Data(base64Encoded: standard,
                              options: .ignoreUnknownCharacters),
              let image = UIImage(data: data) else {
            logger.error("[decodeImage] Base64 디코딩 또는 UIImage 생성 실패")
            return nil
        }
        
        return image
    }
    
    func removePortfolioImage(index: Int) {
        if var images = portfolioImages,
           images.indices.contains(index) {
            images.remove(at: index)
            
            DispatchQueue.main.async {
                self.portfolioImages = images
            }
        }
        
        if selectedPortfolioImages.indices.contains(index) {
            DispatchQueue.main.async {
                self.selectedPortfolioImages.remove(at: index)
            }
        }
    }
    
    func registerService() {
        let request = RegisterServiceRequestDto(
            serviceName: serviceName,
            description: description,
            categoryId: category?.rawValue ?? 0,
            salary: Int(salary) ?? 0
        )
        
        ServiceManager.registerService(request, thumbnailImage: thumbnailImage, portfolioImages: portfolioImages)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[registerService] completion finished")
                case .failure(let error):
                    self?.logger.error("[registerService] completion failed: \(error)")
                }
                
                self?.isEntireProgressViewVisible = false
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[registerService] SUCCESS")
                    self?.isRegisterCompleted = true
                    
                } else {
                    self?.logger.error("[registerService] 응답 처리 실패: \(response.message)")
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
