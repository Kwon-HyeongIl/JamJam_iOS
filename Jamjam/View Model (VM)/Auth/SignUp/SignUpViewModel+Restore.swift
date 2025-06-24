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
    
    func restoreIdRelated() {
        self.isIdFailedNoti1 = false
        self.isIdFailedNoti2 = false
        self.isIdFailedNoti3 = false
        self.isIdFailedNoti4 = false
        self.isIdFinalValidated = false
    }
}
