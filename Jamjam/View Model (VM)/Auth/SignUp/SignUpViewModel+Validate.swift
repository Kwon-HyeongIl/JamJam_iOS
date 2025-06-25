//
//  SignUpViewModel+Validate.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import Foundation

extension SignUpViewModel {
    // MARK: Page 2
    func validateNicknameForm() -> Bool {
        let pattern = "^[가-힣A-Za-z\\d]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.nickname)
    }
    
    func checkNicknameIsDuplicated() {
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
    
    
    func validateIdForm() -> Bool {
        let pattern = "^[a-z][a-z0-9]{3,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.loginId)
    }
    
    func checkIdIsDuplicated() {
        let request = CheckLoginIdRequest(loginId: self.loginId)
        
        AuthCenter.shared.checkLoginId(request)
            .map { $0.content.available }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[checkLoginId] finished")
                case .failure(let error):
                    print("[checkLoginId] failed: \(error)")
                    self?.isloginIdFailedNoti2 = true
                }
            } receiveValue: { [weak self] available in
                if available {
                    self?.isloginIdFinalValidated = true
                } else {
                    self?.isloginIdFailedNoti1 = true
                }
            }
            .store(in: &self.cancellables)
    }
    
    
    func validatePasswordForm() -> Bool {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        return predicate.evaluate(with: self.password)
    }
    
    func validateConfrimPassword() -> Bool {
        return self.password == self.confirmPassword
    }
    
    // MARK: Page 3
    func validateRealNameForm() -> Bool {
        let pattern = "^[가-힣]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        if predicate.evaluate(with: self.realName) {
            self.isRealNameFinalValidated = true
            return true
            
        } else {
            self.isRealNameFailedNoti1 = true
            return false
        }
    }
    
    func validateBirthYearForm() -> Bool {
        let pattern = "^\\d{4}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        if predicate.evaluate(with: self.birthYear) {
            self.isBirthYearLocalValidated = true
            return true
            
        } else {
            self.isBirthFailedNoti1 = true
            return false
        }
    }
    
    func validateBirthMonthForm() -> Bool {
        let pattern = "^(0?[1-9]|1[0-2])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        if predicate.evaluate(with: self.birthMonth) {
            self.isBirthMonthLocalValidated = true
            return true
            
        } else {
            self.isBirthFailedNoti1 = true
            return false
        }
    }
    
    func validateBirthDayForm() -> Bool {
        let pattern = "^(0?[1-9]|[12][0-9]|3[01])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        if predicate.evaluate(with: self.birthDay) {
            self.isBirthDayLocalValidated = true
            return true
            
        } else {
            self.isBirthFailedNoti1 = true
            return false
        }
    }
    
    func validatePhoneNumberForm() -> Bool {
        let pattern = "^010\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.phoneNumber)
    }
}

