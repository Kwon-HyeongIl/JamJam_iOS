//
//  SignUpViewModel+Validate.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import Foundation

extension SignUpViewModel {
    func validateNickname() -> Bool {
        // 백엔드 통신
        return true
    }
    
    func validateId() -> Bool {
        // 백엔드 통신
        return true
    }
    
    func validatePassword() -> Bool {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        return predicate.evaluate(with: self.password)
    }
}

