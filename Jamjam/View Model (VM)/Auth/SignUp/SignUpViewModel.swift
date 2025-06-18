//
//  SignUpViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/17/25.
//

import Foundation

@Observable
class SignUpViewModel {
    var pageIndex = 1
    
    // Page 1
    var signUpUserType: JJUser?
    
    var isExpertButtonTapped = false
    var isClientButtonTapped = false
    var isExpertButtonTappedNoAni = false
    var isClientButtonTappedNoAni = false
    
    // Page 2
    var nickname = ""
    var isNicknameNotification = false
    var isNicknameValidated = false
    
    var id = ""
    var isIdValidated = false
    
    var password = ""
    var confirmPassword = ""
    var isPasswordValidated = false
    
    var isPasswordSecured = true
    var isConfrimPasswordSecured = true
    
    var isAllValidatedPage2 = false
    
    // Page 3
    var name = ""
    var birthYear = ""
    var birthMonth = ""
    var birthDay = ""
    var gender: Gender?
    var isGenderManButtonTapped = false
    var isGenderWomanButtonTapped = false
    var phoneNumber = ""
    var isIdentifiedButtonTapped = false
    var identifiedNumber = ""
    
    var isAllValidatedPage3 = false
}
