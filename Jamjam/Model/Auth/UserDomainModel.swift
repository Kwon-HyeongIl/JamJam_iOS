//
//  JJUser.swift
//  Jamjam
//
//  Created by 권형일 on 7/2/25.
//

import Foundation

struct UserDomainModel: Hashable, Equatable {
    let userId: String
    let realName: String
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userId)
    }
    
    static func == (lhs: UserDomainModel, rhs: UserDomainModel) -> Bool {
        return lhs.userId == rhs.userId
    }
    
}
