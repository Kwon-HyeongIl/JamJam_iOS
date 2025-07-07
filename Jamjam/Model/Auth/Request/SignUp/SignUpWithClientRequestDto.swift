//
//  SignUpWithClientRequest.swift
//  Jamjam
//
//  Created by 권형일 on 6/25/25.
//

import Foundation

struct SignUpWithClientRequestDto: Encodable {
    let name: String
    let nickname: String
    let loginId: String
    let phoneNumber: String
    let password: String
    let birth: String
    let gender: String
}
