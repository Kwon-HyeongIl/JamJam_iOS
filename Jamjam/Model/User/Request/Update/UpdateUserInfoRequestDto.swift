//
//  UpdateUserInfoRequestDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import Foundation

struct UpdateUserInfoRequestDto: Encodable {
    let nickname: String
    let phoneNumber: String
    let password: String?
    let account: Account
    let deleteProfileImage: Bool
    
    struct Account: Encodable {
        let bankCode: String?
        let bankName: String?
        let accountNumber: String?
        let depositor: String?
    }
}
