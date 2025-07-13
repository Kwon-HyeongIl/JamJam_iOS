//
//  SearchServiceRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/13/25.
//

import Foundation

struct SearchServiceRequestDto: Encodable {
    let keyword: String
    let page: Int
    let size: Int
    let sort: [String]
}
