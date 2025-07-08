//
//  GenerateAiThumbnailImageResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/8/25.
//

import Foundation

struct GenerateThumbnailResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let imageBase64: String
    }
}
