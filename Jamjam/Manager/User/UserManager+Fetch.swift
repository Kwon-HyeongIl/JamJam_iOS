//
//  UserManager+Fetch.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import Foundation
import Combine
import Alamofire

extension UserManager {
    static func fetchUserInfo() -> AnyPublisher<FetchUserResponseDto, Error> {
        return AF.request(
            API.fetchUserInfo.url,
            method: .get,
            headers: API.headers
        )
        .publishDecodable(type: FetchUserResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func fetchProvider() -> AnyPublisher<FetchProviderResponseDto, Error> {
        return AF.request(
            API.fetchProvider.url,
            method: .get,
            headers: API.headers
        )
        .publishDecodable(type: FetchProviderResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func fetchProviderProfile(otherUserId: Int) -> AnyPublisher<FetchProviderProfileResponseDto, Error> {
        return AF.request(
            API.fetchOtherProvider(otherUserId).url,
            method: .get,
            headers: API.headers
        )
        .publishDecodable(type: FetchProviderProfileResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
