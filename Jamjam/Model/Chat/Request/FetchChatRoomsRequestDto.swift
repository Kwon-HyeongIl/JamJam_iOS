//
//  fetchChatRoomsRequest.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct FetchChatRoomsRequestDto: Encodable {
    let page: Int
    let size: Int
    let sort: [String]
}
