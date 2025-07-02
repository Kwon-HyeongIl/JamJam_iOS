//
//  SocketConnectionStatus.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

enum SocketConnectionStatus {
    /// 소켓 연결 시도 중 (SwiftStomp .connecting)
    case connecting
    
    /// STOMP까지 완전히 연결된 상태 (SwiftStomp .fullyConnected)
    case connected
    
    /// 연결이 끊어진 상태 (SwiftStomp .socketDisconnected)
    case disconnected
    
    /// 예기치 못한 오류 (SwiftStomp .error)
    case error(Error)
}
