//
//  SignUpWithExpertRequest.swift
//  Jamjam
//
//  Created by 권형일 on 6/24/25.
//

import Foundation

struct SignUpWithProviderRequest: Encodable {
    let name: String
    let nickname: String
    let loginId: String
    let phoneNumber: String
    let password: String
    let birth: String
    let gender: String
}
