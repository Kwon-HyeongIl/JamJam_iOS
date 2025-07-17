//
//  FetchCreditHistoryRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/17/25.
//

import Foundation

struct FetchCreditHistorysRequestDto: Encodable {
    let type: CreditHistoryType
    let page: Int
    let size: Int
    let sort: [String]
}
