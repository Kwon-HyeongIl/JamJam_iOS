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
    var isNicknameFinalValidated = false
    var isNicknameFailedNoti1 = false // 중복
    var isNicknameFailedNoti2 = false // 통신 에러
    var isNicknameFailedNoti3 = false // 10글자 이내의 한글, 영문, 숫자
    var isNicknameFailedNoti4 = false // 2자 이상
    
    var loginId = ""
    var isloginIdFinalValidated = false
    var isloginIdFailedNoti1 = false // 중복
    var isloginIdFailedNoti2 = false // 통신 에러
    var isloginIdFailedNoti3 = false // 소문자 시작 및 소문자 또는 숫자
    var isloginIdFailedNoti4 = false // 4자 이상
    
    var password = ""
    var isPasswordFinalValidated = false
    var isPasswordFailedNoti1 = false
    
    var confirmPassword = ""
    var isConfirmPasswordFailedNoti1 = false
    var isConfirmPasswordFinalValidated = false
    
    var isPasswordSecured = true
    var isConfirmPasswordSecured = true
    
    var isAllValidatedInPage2: Bool {
        isNicknameFinalValidated && isloginIdFinalValidated && isPasswordFinalValidated && isConfirmPasswordFinalValidated
    }
    
    // Page 3
    var realName = ""
    var isRealNameFinalValidated = false
    var isRealNameFailedNoti1 = false
    
    var birthYear = ""
    var isBirthYearLocalValidated = false
    var birthMonth = ""
    var isBirthMonthLocalValidated = false
    var birthDay = ""
    var isBirthDayLocalValidated = false
    var isBirthFinalValidated: Bool {
        isBirthYearLocalValidated && isBirthMonthLocalValidated && isBirthDayLocalValidated
    }
    var isBirthFailedNoti1 = false
    
    var gender: Gender?
    var isGenderManButtonTapped = false
    var isGenderWomanButtonTapped = false
    var isGenderFinalValidated: Bool {
        gender != nil
    }
    
    var phoneNumber = ""
    var isPhoneNumberFailedNoti1 = false
    var isPhoneNumberFinalValidated = false
    
    var isIdentifiedButtonTapped = false
    var identifiedNumber = ""
    var isIdentifiedNumberFailedNoti1 = false
    var isIdentifiedNumberFinalValidated = false
    
    var isAllValidatedInPage3: Bool {
        isRealNameFinalValidated && isBirthFinalValidated && isGenderFinalValidated && isPhoneNumberFinalValidated && isIdentifiedNumberFinalValidated
    }
    
    
}
