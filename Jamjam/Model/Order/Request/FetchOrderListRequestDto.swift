//
//  FetchOrderListRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/15/25.
//

import Foundation

struct FetchOrderListRequestDto: Encodable {
    let orderStatus: OrderState
    let page: Int
    let size: Int
    let sort: [String]
}
