//
//  OrderServiceRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/13/25.
//

import Foundation

struct OrderServiceRequestDto: Encodable {
    let title: String
    let deadline: String
    let description: String
    let price: Int
    let serviceId: Int
}
