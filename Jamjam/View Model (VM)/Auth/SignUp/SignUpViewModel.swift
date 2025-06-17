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
    var signUpUserType: JJUser?
    
    var isExpertButtonTapped = false
    var isClientButtonTapped = false
    
    var nickname = ""
    var id = ""
    var password = ""
    var confirmPassword = ""
    
    var isPasswordSecured = true
    var isConfrimPasswordSecured = true
}
