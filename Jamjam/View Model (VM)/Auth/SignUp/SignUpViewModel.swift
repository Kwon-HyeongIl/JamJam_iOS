//
//  SignUpViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/17/25.
//

import Foundation
import Combine

@Observable
class SignUpViewModel {
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    
    var pageIndex = 0
    
    // Page 1
    var signUpUserType: JJUser?
    
    var isExpertButtonTapped = false
    var isClientButtonTapped = false
    var isExpertButtonTappedNoAni = false
    var isClientButtonTappedNoAni = false
    
    // Page 2
    var nickname =  ""
    
    var isNicknameFailedNoti1 = false // 중복된 닉네임
    var isNicknameFailedNoti2 = false // 통신 에러
    var isNicknameFailedNoti3 = false // 10글자 이내의 한글, 영문, 숫자
    var isNicknameFailedNoti4 = false // 2자 이상
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
