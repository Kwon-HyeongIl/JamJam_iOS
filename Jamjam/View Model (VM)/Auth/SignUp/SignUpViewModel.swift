//
//  SignUpViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/17/25.
//

import Foundation

@Observable
class SignUpViewModel {
    var pageIndex = 2
    var signUpUserType: JJUser?
    
    var isExpertButtonTapped = false
    var isClientButtonTapped = false
    
    var nickname = ""
    var id = ""
    var password = ""
    var confirmPassword = ""
    
    var isPasswordSecured = true
    var isConfrimPasswordSecured = true
    
    var name = ""
    var birthYear = ""
    var birthMonth = ""
    var birthDay = ""
    var gender: Gender?
    var phoneNumber = ""
    var isIdentifiedButtonTapped = false
    var identifiedNumber = ""
    
    var isGenderManButtonTapped = false
    var isGenderWomanButtonTapped = false
}
