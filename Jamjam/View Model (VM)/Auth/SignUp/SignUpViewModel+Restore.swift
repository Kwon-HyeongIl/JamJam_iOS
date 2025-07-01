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
    
    func restoreLoginIdRelated() {
        self.isloginIdFinalValidated = false
        self.isLoginIdNotiVisible = false
        self.loginIdNotiContent = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func restorePasswordRelated() {
        self.isPasswordFinalValidated = false
        self.isPasswordNotiVisible = false
        self.passwordNotiContent = ""
    }
    
    func restoreConfirmPasswordRelated() {
        self.isConfirmPasswordFinalValidated = false
        self.isConfirmPasswordNotiVisible = false
        self.confirmPasswordNotiContent = ""
    }
    
    // MARK: Page 3
    func restoreRealNameRelated() {
        self.isRealNameFinalValidated = false
        self.isRealNameNotiVisible = false
        self.realNameNotiContent = ""
    }
    
    func restoreBirthYearRelated() {
        self.isBirthYearLocalValidated = false
        self.isBirthNotiVisible = false
        self.birthNotiContent = ""
    }
    
    func restoreBirthMonthRelated() {
        self.isBirthMonthLocalValidated = false
        self.isBirthNotiVisible = false
        self.birthNotiContent = ""
    }
    
    func restoreBirthDayRelated() {
        self.isBirthDayLocalValidated = false
        self.isBirthNotiVisible = false
        self.birthNotiContent = ""
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
