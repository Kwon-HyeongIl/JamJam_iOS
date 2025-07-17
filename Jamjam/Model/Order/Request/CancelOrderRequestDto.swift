//
//  CancelOrderRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation

struct CancelOrderRequestDto: Encodable {
    let orderId: Int
    let orderStatus: OrderState
    let cancelReason: String
}
