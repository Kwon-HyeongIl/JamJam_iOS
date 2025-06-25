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
    
    // MARK: Page 1
    var signUpUserType: JJUser?
    
    var isExpertButtonTapped = false
    var isClientButtonTapped = false
    var isExpertButtonTappedNoAni = false
    var isClientButtonTappedNoAni = false
    
    // MARK: Page 2
    var nickname =  ""
    var isNicknameFailedNoti1 = false // 중복
    var isNicknameFailedNoti2 = false // 통신 에러
    var isNicknameFailedNoti3 = false // 10글자 이내의 한글, 영문, 숫자
    var isNicknameFailedNoti4 = false // 2자 이상
    var isNicknameFinalValidated = false
    
    var loginId = ""
    var isloginIdFailedNoti1 = false // 중복
    var isloginIdFailedNoti2 = false // 통신 에러
    var isloginIdFailedNoti3 = false // 소문자 시작 및 소문자 또는 숫자
    var isloginIdFailedNoti4 = false // 4자 이상
    var isloginIdFinalValidated = false
    
    var password = ""
    var isPasswordFailedNoti1 = false // 영문 숫자 포함 8자 이상
    var isPasswordFinalValidated = false
    
    var confirmPassword = ""
    var isConfirmPasswordFailedNoti1 = false // 일치하지 않는 비밀번호
    var isConfirmPasswordFinalValidated = false
    
    var isPasswordSecured = true
    var isConfirmPasswordSecured = true
    
    var isAllValidatedInPage2: Bool {
        isNicknameFinalValidated && isloginIdFinalValidated && isPasswordFinalValidated && isConfirmPasswordFinalValidated
    }
    
    // MARK: Page 3
    var realName = ""
    var isRealNameFailedNoti1 = false // 한글로 2자 이상 입력
    var isRealNameFinalValidated = false
    
    var birthYear = ""
    var isBirthYearLocalValidated = false
    var birthMonth = ""
    var isBirthMonthLocalValidated = false
    var birthDay = ""
    var isBirthDayLocalValidated = false
    var isBirthFailedNoti1 = false // 잘못된 날짜 형식
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
    var isPhoneNumberFailedNoti1 = false // 하이픈 제외 11자 입력
    var isPhoneNumberFailedNoti2 = false
    var isPhoneNumberFinalValidated = false
    
    var isPhoneIdentifiedNumberButtonTapped = false
    var phoneIdentifiedNumber = ""
    var isPhoneIdentifiedNumberFailedNoti1 = false // 잘못된 인증번호
    var isPhoneIdentifiedNumberFinalValidated = false
    
    var isAllFilledInPage3: Bool {
        !realName.isEmpty && !birthYear.isEmpty && !birthMonth.isEmpty && !birthDay.isEmpty && isGenderFinalValidated && isPhoneIdentifiedNumberFinalValidated
    }
    var isAllValidatedInPage3: Bool {
        isRealNameFinalValidated && isBirthFinalValidated && isGenderFinalValidated && isPhoneIdentifiedNumberFinalValidated
    }
}
