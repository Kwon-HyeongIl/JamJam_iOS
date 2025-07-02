//
//  API.swift
//  Jamjam
//
//  Created by 권형일 on 6/23/25.
//

import Foundation
import Alamofire

enum API {
    static let baseURL = "https://api.jamx2.store"
    
    static let headers: HTTPHeaders = [
            "X-Client-Type": "APP",
            "Authorization": "Bearer \(AuthCenter.shared.accessToken ?? "")"
        ]
    
    // MARK: Auth
    case refreshAccessToken
    case login
    case checkNickname
    case checkLoginId
    case sendSms
    case verifySms
    case signUpWithProvider
    case signUpWithClient
    
    // MARK: Chat
    case startChatRoom
    
    var urlString: String {
        switch self {
            // MARK: Auth
        case .refreshAccessToken:
            return "\(API.baseURL)/api/user/reissue/app"
        case .login:
            return "\(API.baseURL)/api/user/login"
        case .checkNickname:
            return "\(API.baseURL)/api/user/check/nickname"
        case .checkLoginId:
            return "\(API.baseURL)/api/user/check/loginId"
        case .sendSms:
            return "\(API.baseURL)/api/user/sms/send"
        case .verifySms:
            return "\(API.baseURL)/api/user/sms/verify"
        case .signUpWithProvider:
            return "\(API.baseURL)/api/user/join/provider"
        case .signUpWithClient:
            return "\(API.baseURL)/api/user/join/client"
            
            // MARK: Chat
        case .startChatRoom:
            return "\(API.baseURL)/api/chat/room"
        }
    }
    
    var url: URL {
        URL(string: urlString)!
    }
}
