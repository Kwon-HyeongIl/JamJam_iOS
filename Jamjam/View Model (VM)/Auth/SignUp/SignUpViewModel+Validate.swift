//
//  SignUpViewModel+Validate.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import Foundation

extension SignUpViewModel {
    func validateNicknameLocal() -> Bool {
        let pattern = "^[가-힣A-Za-z\\d]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.nickname)
    }
    
    func validateNicknameRemote() {
        let request = CheckNicknameRequest(nickname: self.nickname)
        
        AuthCenter.shared.checkNickname(request)
            .map { $0.content.available }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[checkNickname] finished")
                case .failure(let error):
                    print("[checkNickname] failed: \(error)")
                    self?.isNicknameFailedNoti2 = true
                }
            } receiveValue: { [weak self] available in
                if available {
                    self?.isNicknameFinalValidated = true
                } else {
                    self?.isNicknameFailedNoti1 = true
                }
            }
            .store(in: &self.cancellables)
    }
    
    
    func validateIdLocal() -> Bool {
        let pattern = "^[a-z][a-z0-9]{3,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.id)
    }
    
    func validateIdRemote() -> Bool {
        // 백엔드 통신
        return true
    }
    
    func validatePasswordLocal() -> Bool {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        return predicate.evaluate(with: self.password)
    }
    
    func validateConfrimPasswordLocal() -> Bool {
        return self.password == self.confirmPassword
    }
    
    func validateRealNameLocal() -> Bool {
        let pattern = "^[가-힣]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.realName)
    }
    
    func validateBirthYearLocal() -> Bool {
        let pattern = "^\\d{4}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.birthYear)
    }
    
    func validateBirthMonthLocal() -> Bool {
        let pattern = "^(0?[1-9]|1[0-2])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.birthMonth)
    }
    
    func validateBirthDayLocal() -> Bool {
        let pattern = "^(0?[1-9]|[12][0-9]|3[01])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.birthDay)
    }
    
    func validatePhoneNumberLocal() -> Bool {
        let pattern = "^010\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.phoneNumber)
    }
}

