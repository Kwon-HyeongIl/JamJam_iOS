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
class AuthCore {
    static let shared = AuthCore()
    
    var accessToken: String? {
        /// - 동작 과정
        /// 접속: Keychain에서 토큰 가져옴 -> 토큰이 존재하면 재발급 -> accessToken에 저장 -> didSet 호출 -> Keychain에 토큰 저장(+userId 저장)
        /// 로그인/회원가입: 인증 -> 토큰 저장 -> didSet 호출 -> Keychain에 토큰 저장(+userId 저장)
        /// 로그아웃: 토큰에 nil 저장 -> didSet 호출 -> Keychain에서 토큰 삭제(+userId -1)
        didSet {
            logger.info("[accessToken didSet] didSet 호출")
            
            if let accessToken = accessToken, !accessToken.isEmpty {
                logger.info("[accessToken didSet] Keychain에 토큰 저장 시도")
                storeAccessToken(accessToken)
                
                let extractedUserId = extractUserIdFromJWTAccessToken(accessToken)
                if let userId = extractedUserId {
                    logger.info("[accessToken didSet] userId 추출 완료, 저장 시도")
                    self.userId = userId
                    logger.info("[accessToken didSet] 로그인 된 userId: \(userId)")
                    
                } else {
                    logger.error("[accessToken didSet] userId 추출 실패")
                }
                
            } else {
                logger.warning("[accessToken didSet] 빈 토큰 저장, 토큰 삭제 시도")
                deleteAccessToken()
                userId = nil
            }
        }
    }
    
    var userId: Int?
    
    var isLogin: Bool {
        if let accessToken = accessToken, !accessToken.isEmpty {
            true
        } else {
            false
        }
    }
    
    var fcmDeviceToken: String?
    var googleAccessToken: String?
    
    var isStompClientInit = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "AuthCore")
    
    init() {
        let accessToken = fetchAccessToken()
        
        if let accessToken {
            // 토큰이 존재하는 경우 재발급
            logger.info("[init] Keychain에 기존의 토큰 존재")
            refreshAccessToken(accessToken)
            
        } else {
            logger.info("[init] Keychain에 기존의 토큰 없음")
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
        logger.info("[deleteAccessToken] 토큰 삭제")
        Keychain.deleteToken()
    }
    
    
    private func refreshAccessToken(_ accessToken: String) {
        let url = API.refreshAccessToken.url
        let headers: HTTPHeaders = [
                "X-Client-Type": "APP",
                "Authorization": "Bearer \(accessToken)"
            ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            AF.request(url, method: .post, headers: headers)
                .publishDecodable(type: RefreshAccessTokenResponseDto.self)
                .value()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.logger.info("[refreshAccessToken] completion finished")
                    case .failure(let error):
                        self?.logger.error("[refreshAccessToken] completion failed: \(error)")
                    }
                } receiveValue: { [weak self] response in
                    let receivedAccessToken = response.content?.accessToken ?? ""
                    
                    if response.code == "SUCCESS" && !receivedAccessToken.isEmpty {
                        self?.logger.info("[refreshAccessToken] 토큰 응답 완료")
                        self?.accessToken = receivedAccessToken
                        
                    } else {
                        self?.logger.error("[refreshAccessToken] 토큰 응답 실패: \(response.message)")
                    }
                }
                .store(in: &self.cancellables)
        }
    }
    
    private func extractUserIdFromJWTAccessToken(_ accessToken: String) -> Int? {
        let parts = accessToken.split(separator: ".")
        guard parts.count == 3 else { return nil }

        var payload = String(parts[1])
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")

        let missingPadding = 4 - (payload.count % 4)
        if missingPadding < 4 {
            payload += String(repeating: "=", count: missingPadding)
        }

        guard
            let data = Data(base64Encoded: payload),
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        else { return nil }

        if let id = json["userId"] as? Int {
            return id
        }

        if let idString = json["userId"] as? String,
           let id = Int(idString) {
            return id
        }

        return nil
    }

}
