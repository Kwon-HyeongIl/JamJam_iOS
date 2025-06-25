//
//  SignUpViewModel+Restore.swift
//  Jamjam
//
//  Created by 권형일 on 6/25/25.
//

import Foundation

extension SignUpViewModel {
    // Page 2
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
    
    // Page 3
    func restoreRealNameRelated() {
        self.isRealNameFinalValidated = false
        self.isRealNameFailedNoti1 = false
    }
    
    func restoreBirthRelated() {
        self.isBirthYearLocalValidated = false
        self.isBirthMonthLocalValidated = false
        self.isBirthDayLocalValidated = false
        self.isBirthFailedNoti1 = false
    }
    
    func restorePhoneNumberRelated() {
        self.isPhoneNumberFailedNoti1 = false
    }
    
    func restoreIdentifiedNumberRelated() {
        self.isIdentifiedNumberFinalValidated = false
        self.isIdentifiedNumberFailedNoti1 = false
    }
}
