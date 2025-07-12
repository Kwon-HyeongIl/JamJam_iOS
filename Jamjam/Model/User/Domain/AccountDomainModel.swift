//
//  AccountDomainModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import Foundation

struct AccountDomainModel: Hashable, Equatable {
    let bankCode: String
    let bankName: String
    let accountNumber: String
    let depositor: String
    
    let id = UUID() // Hashable, Equatable
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: AccountDomainModel, rhs: AccountDomainModel) -> Bool {
        return lhs.id == rhs.id
    }
}
