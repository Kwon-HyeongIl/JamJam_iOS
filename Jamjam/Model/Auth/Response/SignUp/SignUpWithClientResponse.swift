//
//  SignUpWithClientResponse.swift
//  Jamjam
//
//  Created by 권형일 on 6/23/25.
//

import Foundation

struct SignUpWithClientResponse: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let accessToken: String
        let tokenType: String
        let expiresIn: Double
    }
}
