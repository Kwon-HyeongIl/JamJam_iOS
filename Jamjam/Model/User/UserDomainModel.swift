//
//  JJUser.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct UserDomainModel: Hashable, Equatable {
    let name: String
    let nickname: String
    let phoneNumber: String
    let loginId: String
    let birth: String
    let role: JJUser
    let gender: Gender
    let profileUrl: String
    let account: AccountDomainModel?
    let credit: Int
    
    let id = UUID() // Hashable, Equatable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UserDomainModel, rhs: UserDomainModel) -> Bool {
        return lhs.id == rhs.id
    }
}
