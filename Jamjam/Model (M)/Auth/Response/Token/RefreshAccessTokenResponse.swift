//
//  RefreshAccessTokenResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/1/25.
//

import Foundation

struct RefreshAccessTokenResponse: Decodable {
    let code: String
    let message: String
    let content: Content
    
    struct Content: Decodable {
        let accessToken: String
        let tokenType: String
    }
}
