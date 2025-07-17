//
//  OrderManager+State.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation
import Combine
import Alamofire

extension OrderManager {
    static func acceptOrder(_ orderId: Int) -> AnyPublisher<AcceptOrderResponseDto, Error> {
        return AF.request(
            API.acceptOrder(orderId).url,
            method: .patch,
            headers: API.headers
        )
        .publishDecodable(type: AcceptOrderResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func changeOrderState(_ request: ChangeOrderStateRequestDto) -> AnyPublisher<ChangeOrderStateResponseDto, Error> {
        return AF.request(
            API.changeOrderState.url,
            method: .patch,
            parameters: request,
            encoder: JSONParameterEncoder.default,
            headers: API.headers
        )
        .publishDecodable(type: ChangeOrderStateResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func cancelOrder(_ request: CancelOrderRequestDto) -> AnyPublisher<CancelOrderResponseDto, Error> {
        return AF.request(
            API.cancelOrder.url,
            method: .patch,
            parameters: request,
            encoder: JSONParameterEncoder.default,
            headers: API.headers
        )
        .publishDecodable(type: CancelOrderResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
