//
//  LoginResponse.swift
//  Jamjam
//
//  Created by 권형일 on 6/27/25.
//

import Foundation

struct LoginResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let message: String
        let tokenType: String
        let accessToken: String
    }
}
