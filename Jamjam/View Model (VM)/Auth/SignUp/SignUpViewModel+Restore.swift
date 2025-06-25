//
//  SignUpViewModel+Restore.swift
//  Jamjam
//
//  Created by 권형일 on 6/25/25.
//

import Foundation

extension SignUpViewModel {
    func restoreNicknameRelated() {
        self.isNicknameFinalValidated = false
        self.isNicknameFailedNoti1 = false
        self.isNicknameFailedNoti2 = false
        self.isNicknameFailedNoti3 = false
        self.isNicknameFailedNoti4 = false
    }
    
    func restoreIdRelated() {
        self.isloginIdFinalValidated = false
        self.isloginIdFailedNoti1 = false
        self.isloginIdFailedNoti2 = false
        self.isloginIdFailedNoti3 = false
        self.isloginIdFailedNoti4 = false
    }
    
    func restorePasswordRelated() {
        self.isPasswordFinalValidated = false
        self.isPasswordFailedNoti1 = false
    }
    
    func restoreConfirmPasswordRelated() {
        self.isConfirmPasswordFinalValidated = false
        self.isConfirmPasswordFailedNoti1 = false
    }
}
