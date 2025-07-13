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
    var isReferenceImagesPhotosPickerVisible = false
    var selectedReferenceImages: [PhotosPickerItem] = []
    var referenceImages: [UIImage]?
    
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
        
        for item in selectedReferenceImages {
            if let data = try? await item.loadTransferable(type: Data.self),
               let img = UIImage(data: data) {
                uiImages.append(img)
            }
        }
        
        let covertedUiImages = uiImages
        await MainActor.run {
            self.referenceImages = covertedUiImages
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
        if var images = referenceImages,
           images.indices.contains(index) {
            images.remove(at: index)
            
            DispatchQueue.main.async {
                self.referenceImages = images
            }
        }
        
        if selectedReferenceImages.indices.contains(index) {
            DispatchQueue.main.async {
                self.selectedReferenceImages.remove(at: index)
            }
        }
    }
    
    private func convertISO8601Date(year: String, month: String, day: String) -> String? {
        var dc = DateComponents()
        dc.calendar = Calendar(identifier: .iso8601)
        dc.timeZone = TimeZone(secondsFromGMT: 0)
        dc.year  = Int(year)
        dc.month = Int(month)
        dc.day   = Int(day)
        dc.hour = 0
        dc.minute = 0
        dc.second = 0
        dc.nanosecond = 0
        
        guard let date = dc.date else { return nil }
        
        let formatter = ISO8601DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        return formatter.string(from: date)
    }
    
    func orderService() {
        guard let convertedDeadline = convertISO8601Date(year: deadlineYear, month: deadlineMonth, day: deadlineDay) else { return }
        guard let price = serviceCell?.salary else { return }
        guard let serviceId = serviceCell?.serviceId else { return }
        
        let request = OrderServiceRequestDto(
            title: title,
            deadline: convertedDeadline,
            description: orderDescription,
            price: price,
            serviceId: serviceId
        )
        
        OrderManager.orderService(request, images: referenceImages)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[orderService] finished")
                case .failure(let error):
                    self?.logger.error("[orderService] failed: \(error)")
                }
                
                self?.isEntireProgressViewVisible = false
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[orderService] SUCCESS")
                    //
                    
                } else {
                    self?.logger.error("[orderService] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
