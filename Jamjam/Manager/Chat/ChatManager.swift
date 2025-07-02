//
//  ChatManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation
import Combine
import Alamofire

class ChatManager {
    static func startChatRoom(otherId: Int) -> AnyPublisher<StartChatRoomResponse, Error> {
        let url = API.startChatRoom.url
        let request = StartChatRoomRequest(otherId: otherId)
        
        return AF.request(url, method: .post, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: StartChatRoomResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
