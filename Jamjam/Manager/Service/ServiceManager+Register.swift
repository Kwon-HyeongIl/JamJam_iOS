//
//  ServiceManager+Register.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation
import Combine
import Alamofire

extension ServiceManager {
    static func generateService(_ request: GenerateServiceRequestDto) -> AnyPublisher<GenerateServiceResponseDto, Error> {
        let url = API.generateService.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: GenerateServiceResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func generateThumbnail(_ request: GenerateThumbnailRequestDto) -> AnyPublisher<GenerateThumbnailResponseDto, Error> {
        let url = API.generateThumbnail.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: GenerateThumbnailResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
