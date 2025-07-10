//
//  CheckPasswordResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/11/25.
//

import Foundation

struct CheckPasswordResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let isCorrect: Bool
    }
}
