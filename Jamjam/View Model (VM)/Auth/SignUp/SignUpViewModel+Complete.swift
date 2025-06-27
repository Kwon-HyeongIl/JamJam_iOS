//
//  SignUpViewModel+Complete.swift
//  Jamjam
//
//  Created by 권형일 on 6/19/25.
//

import Foundation

extension SignUpViewModel {
    func completeSignUp() {
        if self.signUpUserType == .provider {
            let request = SignUpWithProviderRequest(name: self.realName, nickname: self.nickname, loginId: self.loginId, phoneNumber: self.phoneNumber, password: self.password, birth: , gender: )
            
            AuthCenter.shared.signUpWithProvider(request)
            
        } else if self.signUpUserType == .client {
            
        }
    }
}
