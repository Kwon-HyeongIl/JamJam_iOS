//
//  UpdateProviderInfoResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/13/25.
//

import Foundation

struct UpdateProviderInfoResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {}
}
