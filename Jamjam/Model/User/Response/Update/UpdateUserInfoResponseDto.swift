//
//  UpdateUserInfoResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import Foundation

struct UpdateUserInfoResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        
    }
}
