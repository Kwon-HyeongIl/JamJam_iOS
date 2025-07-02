//
//  ChatManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation
import Combine
import Alamofire
import SwiftStomp

class ChatManager {
    static let shared = ChatManager()
    
    var client: SwiftStomp!
    
    var socketConnectionStatus = CurrentValueSubject<SocketConnectionStatus, Never>(.disconnected)
    var onMessageReceived = PassthroughSubject<ChatSocketMessageResponse, Never>()
    let decoder: JSONDecoder
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        let url = API.webSocketURL.url
        let headers = ["Authorization": "Bearer \(AuthCenter.shared.accessToken ?? "")"]
        
        client = SwiftStomp(host: url, httpConnectionHeaders: headers)
        client.autoReconnect = true
        client.enableAutoPing()
        
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        bindStompEvents()
    }
    
    func startChatRoom(otherId: String) -> AnyPublisher<StartChatRoomResponse, Error> {
        let url = API.startChatRoom.url
        let request = StartChatRoomRequest(otherId: otherId)
        
        return AF.request(url, method: .post, parameters: request, encoder: URLEncodedFormParameterEncoder.default, headers: API.headers)
            .publishDecodable(type: StartChatRoomResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    private func bindStompEvents() {
            // 연결 상태
            client.eventsUpstream
                .receive(on: DispatchQueue.main)
                .sink { [weak self] event in
                    switch event {
                    case .connected:   self?.socketConnectionStatus.send(.connected)
                    case .disconnected: self?.socketConnectionStatus.send(.disconnected)
                    case .error(let e):
                        print("STOMP Error:", e)
                        self?.socketConnectionStatus.send(.disconnected)
                    }
                }
                .store(in: &cancellables)

            // 메시지 수신
            client.messagesUpstream
                .receive(on: DispatchQueue.main)
                .sink { [weak self] frame in
                    guard case let .text(raw, _, _, _) = frame,
                          let data = raw.data(using: .utf8),
                          let res  = try? self?.decoder.decode(ChatSocketMessageResponse.self, from: data),
                          res.type == .newMessage
                    else { return }

                    self?.onMessageReceived.send(res)
                }
                .store(in: &cancellables)
        }
}
