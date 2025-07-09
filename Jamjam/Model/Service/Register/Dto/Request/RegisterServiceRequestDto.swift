//
//  RegisterServiceRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/8/25.
//

import Foundation

struct RegisterServiceRequestDto: Encodable {
    let serviceName: String
    let description: String
    let categoryId: Int
    let salary: Int
}
