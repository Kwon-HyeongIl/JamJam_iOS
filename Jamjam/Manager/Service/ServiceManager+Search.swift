//
//  ServiceManager+Search.swift
//  Jamjam
//
//  Created by 권형일 on 7/13/25.
//

import Foundation
import Combine
import Alamofire

extension ServiceManager {
    static func searchService(_ request: SearchServiceRequestDto) -> AnyPublisher<SearchServiceResponseDto, Error> {
        return AF.request(
            API.searchService.url,
            method: .get,
            parameters: request,
            encoder: URLEncodedFormParameterEncoder(destination: .queryString),
            headers: API.headers
        )
        .publishDecodable(type: SearchServiceResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
