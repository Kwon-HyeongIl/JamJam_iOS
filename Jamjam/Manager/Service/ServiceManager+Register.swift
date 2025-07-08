//
//  ServiceManager+Register.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

extension ServiceManager {
    static func generateService(_ request: GenerateServiceRequestDto) -> AnyPublisher<GenerateServiceResponseDto, Error> {
        return AF.request(
            API.generateService.url,
            method: .post,
            parameters: request,
            encoder: JSONParameterEncoder.default,
            headers: API.headers
        )
        .publishDecodable(type: GenerateServiceResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func generateThumbnail(_ request: GenerateThumbnailRequestDto) -> AnyPublisher<GenerateThumbnailResponseDto, Error> {
        return AF.request(
            API.generateThumbnail.url,
            method: .post,
            parameters: request,
            encoder: JSONParameterEncoder.default,
            headers: API.headers
        )
        .publishDecodable(type: GenerateThumbnailResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func registerService(_ request: RegisterServiceRequestDto, thumbnailImage: UIImage, portfolioImages: [UIImage]) -> AnyPublisher<RegisterServiceResponseDto, Error> {
        return AF.upload(
            multipartFormData: { form in
                if let json = try? JSONEncoder().encode(request) {
                    form.append(json, withName: "request", mimeType: "application/json")
                }
                
                if let data = thumbnailImage.jpegData(compressionQuality: 0.85) {
                    form.append(data, withName: "thumbnail", fileName: "thumbnail.jpg", mimeType: "image/jpeg")
                }
                
                for (index, img) in portfolioImages.enumerated() {
                    if let data = img.jpegData(compressionQuality: 0.85) {
                        form.append(data, withName: "portfolioImages", fileName: "portfolio_\(index).jpg", mimeType: "image/jpeg")
                    }
                }
            },
            to: API.registerService.url,
            method: .post,
            headers: API.headers
        )
        .publishDecodable(type: RegisterServiceResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
