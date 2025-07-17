//
//  CreditManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation
import Combine
import Alamofire

class CreditManager {
    static func fetchCreditHistorys(_ request: FetchCreditHistorysRequestDto) -> AnyPublisher<FetchCreditHistorysResponseDto, Error> {
        return AF.request(
            API.fetchCreditHistorys.url,
            method: .get,
            parameters: request,
            encoder: URLEncodedFormParameterEncoder(destination: .queryString),
            headers: API.headers
        )
        .publishDecodable(type: FetchCreditHistorysResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
