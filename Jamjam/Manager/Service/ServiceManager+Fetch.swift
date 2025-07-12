//
//  ServiceManager+Fetch.swift
//  Jamjam
//
//  Created by 권형일 on 7/9/25.
//

import Foundation
import Combine
import Alamofire

extension ServiceManager {
    static func fetchServices(_ request: FetchServicesRequestDto) -> AnyPublisher<FetchServicesResponseDto, Error> {
        return AF.request(
            API.fetchServices.url,
            method: .get,
            parameters: request,
            encoder: URLEncodedFormParameterEncoder(destination: .queryString),
            headers: API.headers
        )
        .publishDecodable(type: FetchServicesResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func fetchService(_ request: FetchServiceRequestDto) -> AnyPublisher<FetchServiceResponseDto, Error> {
        return AF.request(
            API.fetchService.url,
            method: .get,
            parameters: request,
            encoder: URLEncodedFormParameterEncoder(destination: .queryString),
            headers: API.headers
        )
        .publishDecodable(type: FetchServiceResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
