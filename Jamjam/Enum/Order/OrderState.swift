//
//  OrderState.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import Foundation

enum OrderState: String {
    case requested = "REQUESTED"
    case waitingConfrim = "WAITING_CONFIRM"
    case preparing = "PREPARING"
    case completed = "COMPLETED"
    case cancelled = "CANCELLED"
}
