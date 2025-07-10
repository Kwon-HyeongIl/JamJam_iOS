//
//  UserManager+Check.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import Foundation
import Combine
import Alamofire

extension UserManager {
    static func checkPassword(_ request: CheckPasswordRequestDto) -> AnyPublisher<CheckPasswordResponseDto, Error> {
        let url = API.checkPassword.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: CheckPasswordResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
