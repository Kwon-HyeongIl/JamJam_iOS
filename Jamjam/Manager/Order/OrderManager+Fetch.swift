//
//  OrderManager+Fetch.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import Foundation
import Combine
import Alamofire

extension OrderManager {
    static func fetchOrderStateCounts() -> AnyPublisher<FetchOrderStateCountsResponseDto, Error> {
        return AF.request(
            API.fetchOrderStateCounts.url,
            method: .get,
            headers: API.headers
        )
        .publishDecodable(type: FetchOrderStateCountsResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func fetchOrderList(_ request: FetchOrderListRequestDto) -> AnyPublisher<FetchOrderListResponseDto, Error> {
        return AF.request(
            API.fetchOrderList.url,
            method: .get,
            parameters: request,
            encoder: URLEncodedFormParameterEncoder(destination: .queryString),
            headers: API.headers
        )
        .publishDecodable(type: FetchOrderListResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
