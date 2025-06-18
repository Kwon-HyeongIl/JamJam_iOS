//
//  SignUpViewModel+Validate.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import Foundation

extension SignUpViewModel {
    func validateNicknameLocal() -> Bool {
        let pattern = "^(?=.*[가-힣])(?=.*[A-Za-z])(?=.*\\d)[가-힣A-Za-z\\d]{1,10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.nickname)
    }
    
    func validateNicknameRemote() -> Bool {
        // 백엔드 통신
        return true
    }
    
    
    func validateIdRemote() -> Bool {
        // 백엔드 통신
        return true
    }
    
    func validateIdLocal() -> Bool {
        let pattern = "^[a-z][a-z0-9]{3,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.id)
    }
    
    func validatePasswordLocal() -> Bool {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        return predicate.evaluate(with: self.password)
    }
}

