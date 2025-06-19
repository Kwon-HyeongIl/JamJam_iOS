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
    var isNicknameNotification = false
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
    
    var isAllValidatedPage2 = false
    
    // Page 3
    var name = ""
    var birth = Date()
    var gender: Gender?
    var isGenderManButtonTapped = false
    var isGenderWomanButtonTapped = false
    var phoneNumber = ""
    var isIdentifiedButtonTapped = false
    var identifiedNumber = ""
    
    var isAllValidatedPage3 = false
}
