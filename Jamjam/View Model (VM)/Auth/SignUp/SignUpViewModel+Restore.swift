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
        self.nicknameNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func restoreLoginIdRelated() {
        self.isloginIdFinalValidated = false
        self.isLoginIdNotiVisible = false
        self.loginIdNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func restorePasswordRelated() {
        self.isPasswordFinalValidated = false
        self.isPasswordNotiVisible = false
        self.passwordNotiMessage = ""
    }
    
    func restoreConfirmPasswordRelated() {
        self.isConfirmPasswordFinalValidated = false
        self.isConfirmPasswordNotiVisible = false
        self.confirmPasswordNotiMessage = ""
    }
    
    // MARK: Page 3
    func restoreRealNameRelated() {
        self.isRealNameFinalValidated = false
        self.isRealNameNotiVisible = false
        self.realNameNotiMessage = ""
    }
    
    func restoreBirthYearRelated() {
        self.isBirthYearLocalValidated = false
        self.isBirthNotiVisible = false
        self.birthNotiMessage = ""
    }
    
    func restoreBirthMonthRelated() {
        self.isBirthMonthLocalValidated = false
        self.isBirthNotiVisible = false
        self.birthNotiMessage = ""
    }
    
    func restoreBirthDayRelated() {
        self.isBirthDayLocalValidated = false
        self.isBirthNotiVisible = false
        self.birthNotiMessage = ""
    }
    
    func restorePhoneNumberRelated() {
        self.isPhoneNumberFinalValidated = false
        self.isPhoneNumberNotiVisible = false
        self.phoneNumberNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func restoreIdentifiedNumberRelated() {
        self.isPhoneCodeFinalValidated = false
        self.isPhoneCodeNotiVisible = false
        self.phoneCodeNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
}
