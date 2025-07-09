//
//  AuthManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation
import Combine
import Alamofire

class UserManager {
    static func fetchUser() -> AnyPublisher<FetchUserResponseDto, Error> {
        return AF.request(
            API.fetchUser.url,
            method: .get,
            headers: API.headers
        )
        .publishDecodable(type: FetchUserResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
