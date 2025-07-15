//
//  SignUpViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/17/25.
//

import Foundation
import Combine
import os

@Observable
class SignUpViewModel {
    var pageIndex = 0
    
    // MARK: Page 1
    var signUpUserType: UserRole?
    
    var isExpertButtonTapped = false
    var isClientButtonTapped = false
    var isExpertButtonTappedNoAni = false
    var isClientButtonTappedNoAni = false
    
    // MARK: Page 2
    var nickname =  ""
    var isNicknameNotiVisible = false
    var nicknameNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isNicknameFinalValidated = false
    
    var loginId = ""
    var isLoginIdNotiVisible = false
    var loginIdNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isloginIdFinalValidated = false
    
    var password = ""
    var isPasswordNotiVisible = false
    var passwordNotiMessage = ""
    var isPasswordFinalValidated = false
    
    var confirmPassword = ""
    var isConfirmPasswordNotiVisible = false
    var confirmPasswordNotiMessage = ""
    var isConfirmPasswordFinalValidated = false
    
    var isPasswordSecured = true
    var isConfirmPasswordSecured = true
    
    var isAllValidatedInPage2: Bool {
        isNicknameFinalValidated && isloginIdFinalValidated && isPasswordFinalValidated && isConfirmPasswordFinalValidated
    }
    
    // MARK: Page 3
    var realName = ""
    var isRealNameNotiVisible = false
    var realNameNotiMessage = ""
    var isRealNameFinalValidated = false
    
    var birthYear = ""
    var isBirthYearLocalValidated = false
    var birthMonth = ""
    var isBirthMonthLocalValidated = false
    var birthDay = ""
    var isBirthDayLocalValidated = false
    var isBirthNotiVisible = false
    var birthNotiMessage = ""
    var isBirthFinalValidated: Bool {
        isBirthYearLocalValidated && isBirthMonthLocalValidated && isBirthDayLocalValidated
    }
    var formattedBirthDate: String {
        birthYear + "-" + birthMonth + "-" + birthDay
    }
    
    var gender: Gender?
    var isGenderManButtonTapped = false
    var isGenderWomanButtonTapped = false
    var isGenderFinalValidated: Bool {
        gender != nil
    }
    
    var phoneNumber = ""
    var isPhoneNumberNotiVisible = false
    var phoneNumberNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isPhoneNumberFinalValidated = false
    var isPhoneNumberSendingButtonTapped = false
    
    var phoneCode = ""
    var isPhoneCodeNotiVisible = false
    var phoneCodeNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isPhoneCodeFinalValidated = false
    
    var isAllFilledInPage3: Bool {
        !realName.isEmpty && !birthYear.isEmpty && !birthMonth.isEmpty && !birthDay.isEmpty && isGenderFinalValidated && isPhoneCodeFinalValidated
    }
    var isAllValidatedInPage3: Bool {
        isRealNameFinalValidated && isBirthFinalValidated && isGenderFinalValidated && isPhoneCodeFinalValidated
    }
    
    // MARK: SignUp Complete
    var isSignUpAlertVisible = false
    var signUpAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isSignUpCompleted = false
    
    // MARK: Progress View
    var isEntireProgressViewVisible = false
    var isProgressViewVisibleInNickname = false
    var isProgressViewVisibleInLoginId = false
    var isProgressViewVisibleInPhoneNumber = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "SignUpViewModel")
}
