//
//  CheckLoginIdResponse.swift
//  Jamjam
//
//  Created by 권형일 on 6/25/25.
//

import Foundation

struct CheckLoginIdResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let available: Bool
    }
}
