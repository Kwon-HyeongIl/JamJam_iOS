//
//  AuthCenter.swift
//  Jamjam
//
//  Created by 권형일 on 6/23/25.
//

import Foundation
import Combine
import Alamofire

@Observable
class AuthCenter {
    static let shared = AuthCenter()
    
    var accessToken: String? {
        /// - 동작 과정
        /// 접속: Keychain에서 토큰 가져옴 -> 토큰이 존재하면 재발급 -> accessToken에 저장 -> didSet 호출 -> Keychain에 토큰 저장
        /// 로그인/회원가입: 인증 -> 토큰 저장 -> didSet 호출 -> Keychain에 토큰 저장
        /// 로그아웃: 토큰에 nil 저장 -> didSet 호출 -> Keychain에서 토큰 삭제
        didSet {
            if let token = accessToken, !token.isEmpty {
                storeToken(token)
            } else {
                deleteToken()
            }
        }
    }
    
    var isLogin: Bool {
        if let token = accessToken, !token.isEmpty {
            true
        } else {
            false
        }
    }
    
    var fcmDeviceToken: String?
    var googleAccessToken: String?
    
    init() {
        let token = fetchToken()
        
        if token != nil {
            // 토큰이 존재하는 경우 재발급
            refreshToken()
        }
    }
    
    
    // MARK: KeyChain
    private func fetchToken() -> String? {
        Keychain.fetchToken()
    }
    
    private func storeToken(_ token: String) {
        if Keychain.storeToken(token) {
            print("AccessToken keychain saved successfully")
        } else {
            print("AccessToken keychain save failed")
        }
    }
    
    private func deleteToken() {
        Keychain.deleteToken()
    }
    
    
    // MARK: Refresh
    private func refreshToken() {
        
    }
}
