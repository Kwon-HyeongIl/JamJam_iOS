//
//  FetchUserResponseDto.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import Foundation

struct FetchUserResponseDto: Decodable {
    let code: String
    let message: String
    let content: Content?
    
    struct Content: Decodable {
        let name: String
        let nickname: String
        let phoneNumber: String
        let loginId: String
        let birth: String
        let role: String
        let gender: String
        let profileUrl: String
        let account: Account?
        let credit: Int
        
        struct Account: Decodable {
            let bankCode: String
            let bankName: String
            let accountNumber: String
            let depositor: String
        }
    }
}
