//
//  ChatManager+Room.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation
import Combine
import Alamofire

extension ChatManager {
    func startChatRoom(otherId: String) -> AnyPublisher<StartChatRoomResponse, Error> {
        let url = API.startChatRoom.url
        let request = StartChatRoomRequest(otherId: otherId)
        
        return AF.request(url, method: .post, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: StartChatRoomResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func fetchChatRooms(request: FetchChatRoomsRequest) -> AnyPublisher<FetchChatRoomsResponse, Error> {
        let url = API.fetchChatRooms.url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: FetchChatRoomsResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func fetchChatMessages(request: FetchChatMessagesRequest, chatRoomId: Int) -> AnyPublisher<FetchChatMessagesResponse, Error> {
        let url = API.fetchChatMessages("\(chatRoomId)").url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: FetchChatMessagesResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func deleteChatRoom(targetChatRoomId: Int) -> AnyPublisher<DeleteChatRoomResponse, Error> {
        let url = API.deleteChatRoom("\(targetChatRoomId)").url
        
        return AF.request(url, method: .delete, headers: API.headers)
            .publishDecodable(type: DeleteChatRoomResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
