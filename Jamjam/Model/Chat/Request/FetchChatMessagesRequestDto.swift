//
//  FetchChatMessagesResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/3/25.
//

import Foundation

struct FetchChatMessagesRequestDto: Encodable {
    let page: Int
    let size: Int
    let sort: [String]
}
