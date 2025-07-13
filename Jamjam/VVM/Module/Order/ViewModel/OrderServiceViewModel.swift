//
//  OrderServiceViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/12/25.
//

import SwiftUI
import PhotosUI
import Combine
import os

@Observable
class OrderServiceViewModel {
    var serviceCell: ServiceCellDomainModel?
    
    var title = ""
    var deadlineYear = ""
    var deadlineMonth = ""
    var deadlineDay = ""
    var orderDescription = ""
    var isPortfolioPhotosPickerVisible = false
    var selectedPortfolioImages: [PhotosPickerItem] = []
    var portfolioImages: [UIImage]?
    
    var isUsagePolicyInfoButtonTapped = false
    var isAgreeUsagePolicy = false
    
    var isAllValidated: Bool {
        !title.isEmpty && !deadlineYear.isEmpty && !deadlineMonth.isEmpty && !deadlineDay.isEmpty && !orderDescription.isEmpty && isAgreeUsagePolicy
    }
    
    var isEntireProgressViewVisible = false
    var isOrderAlertVisible = false
    var orderAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "OrderServiceViewModel")
    
    init(serviceCell: ServiceCellDomainModel?) {
        self.serviceCell = serviceCell
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
}
