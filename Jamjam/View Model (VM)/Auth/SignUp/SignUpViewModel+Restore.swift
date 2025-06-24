//
//  SignUpViewModel+Restore.swift
//  Jamjam
//
//  Created by 권형일 on 6/25/25.
//

import Foundation

extension SignUpViewModel {
    func restoreNicknameRelated() {
        self.isNicknameFailedNoti1 = false 
        self.isNicknameFailedNoti2 = false
        self.isNicknameFailedNoti3 = false
        self.isNicknameFailedNoti4 = false
        self.isNicknameFinalValidated = false
    }
}
