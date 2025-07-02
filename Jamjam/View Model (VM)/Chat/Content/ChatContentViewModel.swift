//
//  ChatContentViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/28/25.
//

import Foundation

@Observable
class ChatContentViewModel {
    let user: JJUserModel
    let roomId: Int
    var chatMessage = ""
    
    init(user: JJUserModel, roomId: Int) {
        self.user = user
        self.roomId = roomId
    }
}
