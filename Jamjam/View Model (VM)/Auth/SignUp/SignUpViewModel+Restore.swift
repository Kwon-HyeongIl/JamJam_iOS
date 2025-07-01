//
//  SignUpViewModel+Restore.swift
//  Jamjam
//
//  Created by 권형일 on 6/25/25.
//

import Foundation

extension SignUpViewModel {
    // MARK: Page 2
    func restoreNicknameRelated() {
        self.isNicknameFinalValidated = false
        self.isNicknameNotiVisible = false
        self.nicknameNotiContent = "문제가 발생하였습니다. 다시 시도해 주세요."
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
    
    // MARK: Page 3
    func restoreRealNameRelated() {
        self.isRealNameFinalValidated = false
        self.isRealNameFailedNoti1 = false
    }
    
    func restoreBirthYearRelated() {
        self.isBirthYearLocalValidated = false
        self.isBirthFailedNoti1 = false
    }
    
    func restoreBirthMonthRelated() {
        self.isBirthMonthLocalValidated = false
        self.isBirthFailedNoti1 = false
    }
    
    func restoreBirthDayRelated() {
        self.isBirthDayLocalValidated = false
        self.isBirthFailedNoti1 = false
    }
    
    func restorePhoneNumberRelated() {
        self.isPhoneNumberFailedNoti1 = false
        self.isPhoneNumberFailedNoti2 = false
        self.isPhoneNumberFinalValidated = false
    }
    
    func restoreIdentifiedNumberRelated() {
        self.isPhoneCodeFailedNoti1 = false
        self.isPhoneCodeFailedNoti2 = false
        self.isPhoneCodeFinalValidated = false
    }
}
