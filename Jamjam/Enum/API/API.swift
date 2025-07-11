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
        "content-type": "application/json",
        "X-Client-Type": "APP",
        "Authorization": "Bearer \(AuthCore.shared.accessToken ?? "")"
    ]
    
    static let socketHeaders = [
        "content-type": "application/json",
        "Authorization": "Bearer \(AuthCore.shared.accessToken ?? "")",
        "Heart-Beat": "10000, 10000"
    ]
    
    // MARK: Auth
    case refreshAccessToken
    
    // MARK: User
    case fetchUser
    case login
    case checkNickname
    case checkLoginId
    case sendSms
    case verifySms
    case signUpWithProvider
    case signUpWithClient
    case updateUserInfo
    case checkPassword
    
    case fetchProvider
    
    // MARK: Home
    case fetchServices
    case fetchService
    
    // MARK: RegisterService
    case generateService
    case generateThumbnail
    case registerService
    
    // MARK: Chat
    case webSocketURL
    
    case startChatRoom
    case fetchChatRooms
    case fetchChatMessages(Int)
    case readLastMessage(Int)
    case deleteChatRoom(Int)
    
    var urlString: String {
        switch self {
            // MARK: Auth
        case .refreshAccessToken:
            return "\(API.baseURL)/api/user/reissue/app"
            
            // MARK: User
        case .fetchUser:
            return "\(API.baseURL)/api/user"
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
        case .updateUserInfo:
            return "\(API.baseURL)/api/user"
        case .checkPassword:
            return "\(API.baseURL)/api/user/check-password"
            
        case .fetchProvider:
            return "\(API.baseURL)/api/providers"
            
            // MARK: Home
        case .fetchServices:
            return "\(API.baseURL)/api/service/service-list"
        case .fetchService:
            return "\(API.baseURL)/api/service/detail"
            
            // MARK: RegisterService
        case .generateService:
            return "\(API.baseURL)/api/service/generate"
        case .generateThumbnail:
            return "\(API.baseURL)/api/service/ai-thumbnail"
        case .registerService:
            return "\(API.baseURL)/api/service/register"
            
            // MARK: Chat
        case .webSocketURL:
            return "wss://api.jamx2.store/ws-chat"
            
        case .startChatRoom:
            return "\(API.baseURL)/api/chat/room"
        case .fetchChatRooms:
            return "\(API.baseURL)/api/chat/rooms"
        case .fetchChatMessages(let chatRoomId):
            return "\(API.baseURL)/api/chat/rooms/\(chatRoomId)/messages"
        case .readLastMessage(let chatRoomId):
            return "\(API.baseURL)/api/chat/rooms/\(chatRoomId)/read"
        case .deleteChatRoom(let chatRoomId):
            return "\(API.baseURL)/api/chat/rooms/\(chatRoomId)"
        }
    }
    
    var url: URL {
        URL(string: urlString)!
    }
}
