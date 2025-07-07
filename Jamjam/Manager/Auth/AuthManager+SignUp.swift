//
//  AuthManager+SignUp.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation
import Combine
import Alamofire

extension AuthManager {
    static func checkNickname(_ request: CheckNicknameRequest) -> AnyPublisher<CheckNicknameResponse, Error> {
        let url = API.checkNickname.url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: CheckNicknameResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func checkLoginId(_ request: CheckLoginIdRequest) -> AnyPublisher<CheckLoginIdResponse, Error> {
        let url = API.checkLoginId.url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: CheckLoginIdResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func sendSms(_ request: SendSmsRequest) -> AnyPublisher<SendSmsResponse, Error> {
        let url = API.sendSms.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: SendSmsResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func verifySms(_ request: VerifySmsRequest) -> AnyPublisher<VerifySmsResponse, Error> {
        let url = API.verifySms.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: VerifySmsResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func signUpWithProvider(_ request: SignUpWithProviderRequest) -> AnyPublisher<SignUpWithProviderResponse, Error> {
        let url = API.signUpWithProvider.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: SignUpWithProviderResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func signUpWithClient(_ request: SignUpWithClientRequest) -> AnyPublisher<SignUpWithClientResponse, Error> {
        let url = API.signUpWithClient.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: SignUpWithClientResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
