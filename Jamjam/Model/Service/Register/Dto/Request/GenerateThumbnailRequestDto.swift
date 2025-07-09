//
//  GenerateAiThumbnail.swift
//  Jamjam
//
//  Created by 권형일 on 7/8/25.
//

import Foundation

struct GenerateThumbnailRequestDto: Encodable {
    let serviceName: String
    let description: String
    let typography: Bool
}
