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
    var signUpUserType: JJUser?
    
    var nickname = ""
    var id = ""
    var password = ""
    var confirmPassword = ""
    
    var isPasswordSecured = true
    var isConfrimPasswordSecured = true
}
