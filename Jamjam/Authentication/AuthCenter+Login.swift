//
//  AuthCenter+Login.swift
//  Jamjam
//
//  Created by 권형일 on 6/27/25.
//

import Foundation
import Combine
import Alamofire

extension AuthCenter {
    func login(_ request: LoginRequest) -> AnyPublisher<LoginResponse, Error> {
        let url = API.login.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: LoginResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func logout() {
        logger.info("[logout]")
        self.accessToken = nil
    }
}
