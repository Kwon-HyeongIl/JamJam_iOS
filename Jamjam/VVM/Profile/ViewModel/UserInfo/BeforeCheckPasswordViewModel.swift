//
//  BeforeCheckPasswordViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import Foundation

@Observable
class BeforeCheckPasswordViewModel {
    let user: UserDomainModel?
    
    init(user: UserDomainModel?) {
        self.user = user
    }
}
