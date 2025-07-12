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
    static func startChat(otherId: Int) -> AnyPublisher<StartChatResponseDto, Error> {
        let url = API.startChat.url
        let request = StartChatRequestDto(otherId: otherId)
        
        return AF.request(url, method: .post, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: StartChatResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func fetchChatRooms(request: FetchChatRoomsRequestDto) -> AnyPublisher<FetchChatRoomsResponseDto, Error> {
        let url = API.fetchChatRooms.url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: FetchChatRoomsResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func fetchChatMessages(request: FetchChatMessagesRequestDto, chatRoomId: Int) -> AnyPublisher<FetchChatMessagesResponseDto, Error> {
        let url = API.fetchChatMessages(chatRoomId).url
        
        return AF.request(url, method: .get, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: FetchChatMessagesResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func readLastMessage(request: ReadLastMessageRequestDto, chatRoomId: Int) -> AnyPublisher<ReadLastMessageResponseDto, Error> {
        let url = API.readLastMessage(chatRoomId).url
        
        return AF.request(url, method: .put, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: ReadLastMessageResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    static func deleteChatRoom(targetChatRoomId: Int) -> AnyPublisher<DeleteChatRoomResponseDto, Error> {
        let url = API.deleteChatRoom(targetChatRoomId).url
        
        return AF.request(url, method: .delete, headers: API.headers)
            .publishDecodable(type: DeleteChatRoomResponseDto.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
