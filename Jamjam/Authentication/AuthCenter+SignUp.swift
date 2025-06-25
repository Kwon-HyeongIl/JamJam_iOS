//
//  AuthCenter+SignUp.swift
//  Jamjam
//
//  Created by 권형일 on 6/24/25.
//

import Foundation
import Combine
import Alamofire

extension AuthCenter {
    func checkNickname(_ request: CheckNicknameRequest) -> AnyPublisher<CheckNicknameResponse, Error> {
        let url = API.checkNickname.url

        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .validate()
            .publishDecodable(type: CheckNicknameResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func checkLoginId(_ request: CheckLoginIdRequest) -> AnyPublisher<CheckLoginIdResponse, Error> {
        let url = API.checkLoginId.url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .validate()
            .publishDecodable(type: CheckLoginIdResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func signUpWithProvider(_ request: SignUpWithExpertRequest) -> AnyPublisher<SignUpWithExpertResponse, Error> {
        let url = API.signUpWithExpert.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .validate()
            .publishDecodable(type: SignUpWithExpertResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func signUpWithClient() {
        
    }
}
