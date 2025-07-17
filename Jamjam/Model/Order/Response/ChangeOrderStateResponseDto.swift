//
//  ChangeOrderStateResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation

struct ChangeOrderStateResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {}
}
