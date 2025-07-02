//
//  StartChatRoomResponse.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct StartChatRoomResponse: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let roomId: Int
    }
}
