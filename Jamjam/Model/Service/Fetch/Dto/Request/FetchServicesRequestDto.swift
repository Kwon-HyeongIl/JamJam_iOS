//
//  FetchServiceListRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/9/25.
//

import Foundation

struct FetchServicesRequestDto: Encodable {
    let category: Int
    let page: Int
    let size: Int
    let sort: [String]
}
