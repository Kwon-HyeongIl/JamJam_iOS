//
//  AuthCenter.swift
//  Jamjam
//
//  Created by 권형일 on 6/23/25.
//

import Foundation
import Combine
import Alamofire
import os

@Observable
class AuthCenter {
    static let shared = AuthCenter()
    
    var accessToken: String? {
        /// - 동작 과정
        /// 접속: Keychain에서 토큰 가져옴 -> 토큰이 존재하면 재발급 -> accessToken에 저장 -> didSet 호출 -> Keychain에 토큰 저장
        /// 로그인/회원가입: 인증 -> 토큰 저장 -> didSet 호출 -> Keychain에 토큰 저장
        /// 로그아웃: 토큰에 nil 저장 -> didSet 호출 -> Keychain에서 토큰 삭제
        didSet {
            if let accessToken = accessToken, !accessToken.isEmpty {
                storeToken(accessToken)
            } else {
                deleteToken()
            }
        }
    }
    
    var isLogin: Bool {
        if let accessToken = accessToken, !accessToken.isEmpty {
            true
        } else {
            false
        }
    }
    
    var fcmDeviceToken: String?
    var googleAccessToken: String?
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    
    let logger = Logger(subsystem: "com.khi.jamjam", category: "AuthCenter")
    
    init() {
        let accessToken = fetchAccessToken()
        
        if let accessToken {
            // 토큰이 존재하는 경우 재발급
            logger.info("[init] Keychain에 기존의 토큰 존재")
            refreshAccessToken(accessToken)
        }
    }
    
    
    // MARK: KeyChain
    private func fetchAccessToken() -> String? {
        Keychain.fetchToken()
    }
    
    private func storeAccessToken(_ token: String) {
        if Keychain.storeToken(token) {
            logger.info("[storeAccessToken] 토큰 저장 완료")
        } else {
            logger.info("[storeAccessToken] 토큰 저장 실패")
        }
    }
    
    private func deleteAccessToken() {
        Keychain.deleteToken()
    }
    
    
    // MARK: Refresh
    private func refreshAccessToken(_ accessToken: String) {
        let url = API.refreshAccessToken.url
        let request = RefreshAccessTokenRequest(accessToken: accessToken)
        
        AF.request(url, method: .post, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .validate()
            .publishDecodable(type: RefreshAccessTokenResponse.self)
            .value()
            .map { $0 }
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[refreshAccessToken] completion finished")
                case .failure(let error):
                    self?.logger.error("[refreshAccessToken] completion failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                let receivedAccessToken = response.content.accessToken
                
                if response.code == "SUCCESS" && !receivedAccessToken.isEmpty {
                    self?.accessToken = receivedAccessToken
                    self?.storeAccessToken(receivedAccessToken)
                    
                    self?.logger.info("[refreshAccessToken] 토큰 응답 완료")
                    
                } else {
                    self?.logger.error("[refreshAccessToken] 토큰 응답 실패")
                }
            }
            .store(in: &cancellables)
    }
}
