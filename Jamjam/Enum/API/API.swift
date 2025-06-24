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
            "X-Client-Type": "APP"
        ]
    
    // Auth
    case login
    case signUpWithExpert
    case signUpWithClient
    
    var urlString: String {
        switch self {
        case .login:
            return "\(API.baseURL)/api/user/login"
        case .signUpWithExpert: 
            return "\(API.baseURL)/api/user/join/provider"
        case .signUpWithClient: 
            return "\(API.baseURL)/api/user/join/client"
        }
    }
    
    var url: URL {
        URL(string: urlString)!
    }
}
