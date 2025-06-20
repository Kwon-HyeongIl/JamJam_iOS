//
//  SignUpViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/17/25.
//

import Foundation

@Observable
class SignUpViewModel {
    var pageIndex = 0
    
    // Page 1
    var signUpUserType: JJUser?
    
    var isExpertButtonTapped = false
    var isClientButtonTapped = false
    var isExpertButtonTappedNoAni = false
    var isClientButtonTappedNoAni = false
    
    // Page 2
    var nickname = ""
    var isNicknameLocalNotification = false
    var isNicknameRemoteNotification = false
    var isNicknameLocalValidated = false
    var isNicknameFinalValidated = false
    
    var id = ""
    var isIdNotification = false
    var isIdRemoteNotification = false
    var isIdLocalValidated = false
    var isIdFinalValidated = false
    
    var password = ""
    var isPasswordNotification = false
    var isPasswordFinalValidated = false
    
    var confirmPassword = ""
    var isConfirmPasswordNotification = false
    var isConfirmPasswordFinalValidated = false
    
    var isPasswordSecured = true
    var isConfirmPasswordSecured = true
    
    var isAllValidatedInPage2: Bool {
        isNicknameFinalValidated && isIdFinalValidated && isPasswordFinalValidated && isConfirmPasswordFinalValidated
    }
    
    // Page 3
    var realName = ""
    var isRealNameNotification = false
    var isRealNameFinalValidated = false
    
    var birthYear = ""
    var isBirthYearLocalValidated = false
    var birthMonth = ""
    var isBirthMonthLocalValidated = false
    var birthDay = ""
    var isBirthDayLocalValidated = false
    var isBirthNotification = false
    var isBirthFinalValidated: Bool {
        isBirthYearLocalValidated && isBirthMonthLocalValidated && isBirthDayLocalValidated
    }
    
    var gender: Gender?
    var isGenderManButtonTapped = false
    var isGenderWomanButtonTapped = false
    var isGenderFinalValidated: Bool {
        gender != nil
    }
    
    var phoneNumber = ""
    var isPhoneNumberNotification = false
    var isPhoneNumberFinalValidated = false
    
    var isIdentifiedButtonTapped = false
    var identifiedNumber = ""
    var isIdentifiedNumberNotification = false
    var isIdentifiedNumberFinalValidated = false
    
    var isAllValidatedInPage3: Bool {
        isRealNameFinalValidated && isBirthFinalValidated && isGenderFinalValidated && isPhoneNumberFinalValidated && isIdentifiedNumberFinalValidated
    }
    
    
}
