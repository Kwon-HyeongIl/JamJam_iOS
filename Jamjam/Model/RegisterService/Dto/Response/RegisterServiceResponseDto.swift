//
//  RegisterServiceResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/9/25.
//

import Foundation

struct RegisterServiceResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {}
}
