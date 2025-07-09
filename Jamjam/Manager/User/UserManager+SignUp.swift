//
//  AuthManager+SignUp.swift
//  Jamjam
//
//  Created by 권형일 on 7/7/25.
//

import Foundation
import Combine
import Alamofire

extension UserManager {
    static func checkNickname(_ request: CheckNicknameRequestDto) -> AnyPublisher<CheckNicknameResponseDto, Error> {
        let url = API.checkNickname.url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: CheckNicknameResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func checkLoginId(_ request: CheckLoginIdRequestDto) -> AnyPublisher<CheckLoginIdResponseDto, Error> {
        let url = API.checkLoginId.url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: CheckLoginIdResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func sendSms(_ request: SendSmsRequestDto) -> AnyPublisher<SendSmsResponseDto, Error> {
        let url = API.sendSms.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: SendSmsResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func verifySms(_ request: VerifySmsRequestDto) -> AnyPublisher<VerifySmsResponseDto, Error> {
        let url = API.verifySms.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: VerifySmsResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func signUpWithProvider(_ request: SignUpWithProviderRequestDto) -> AnyPublisher<SignUpWithProviderResponseDto, Error> {
        let url = API.signUpWithProvider.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: SignUpWithProviderResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func signUpWithClient(_ request: SignUpWithClientRequestDto) -> AnyPublisher<SignUpWithClientResponseDto, Error> {
        let url = API.signUpWithClient.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: SignUpWithClientResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
