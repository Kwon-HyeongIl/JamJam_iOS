//
//  SignUpViewModel+Validate.swift
//  Jamjam
//
//  Created by 권형일 on 6/18/25.
//

import SwiftUI

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
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[checkNickname] finished")
                case .failure(let error):
                    print("[checkNickname] failed: \(error)")
                    self?.isNicknameNotiVisible = true
                }
                
                self?.isProgressViewVisibleInNickname = false
                
            } receiveValue: { [weak self] response in
                if let available = response.content?.available, available == true {
                    self?.isNicknameFinalValidated = true
                    self?.isNicknameNotiVisible = true
                    self?.nicknameNotiMessage = "사용 가능한 닉네임 입니다."
                    
                } else {
                    self?.isNicknameNotiVisible = true
                    self?.nicknameNotiMessage = response.message
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
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[checkLoginId] finished")
                case .failure(let error):
                    print("[checkLoginId] failed: \(error)")
                    self?.isLoginIdNotiVisible = true
                }
                
                self?.isProgressViewVisibleInLoginId = false
                
            } receiveValue: { [weak self] response in
                if let available = response.content?.available, available == true {
                    self?.isloginIdFinalValidated = true
                    self?.isLoginIdNotiVisible = true
                    self?.loginIdNotiMessage = "사용 가능한 아이디 입니다."
                    
                } else {
                    self?.isLoginIdNotiVisible = true
                    self?.loginIdNotiMessage = response.message
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
        return predicate.evaluate(with: self.realName)
    }
    
    func validateBirthYearForm() -> Bool {
        let pattern = "^\\d{4}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.birthYear)
    }
    
    func validateBirthMonthForm() -> Bool {
        let pattern = "^(0?[1-9]|1[0-2])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.birthMonth)
    }
    
    func validateBirthDayForm() -> Bool {
        let pattern = "^(0?[1-9]|[12][0-9]|3[01])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.birthDay)
    }
    
    func validatePhoneNumberForm() -> Bool {
        let pattern = "^010\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.phoneNumber)
    }
    
    func sendPhoneNumber() {
        let request = SendSmsRequest(phoneNumber: self.phoneNumber)
        
        AuthCenter.shared.sendSms(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[sendSms] finished")
                case .failure(let error):
                    print("[sendSms] failed: \(error)")
                    self?.isPhoneNumberNotiVisible = true
                }
                
                self?.isProgressViewVisibleInPhoneNumber = false
                
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.isPhoneNumberFinalValidated = true
                    self?.isPhoneNumberNotiVisible = true
                    self?.phoneNumberNotiMessage = "인증코드가 발송 되었습니다."
                    
                } else {
                    self?.isPhoneNumberNotiVisible = true
                    self?.phoneNumberNotiMessage = response.message
                }
            }
            .store(in: &self.cancellables)
    }
    
    func verifyPhoneIdentifiedNumber() {
        let request = VerifySmsRequest(phoneNumber: self.phoneNumber, code: self.phoneCode)
        
        AuthCenter.shared.verifySms(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[verifySms] finished")
                case .failure(let error):
                    print("[verifySms] failed: \(error)")
                    self?.isPhoneCodeNotiVisible = true
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.isPhoneCodeFinalValidated = true
                    self?.isPhoneCodeNotiVisible = true
                    self?.phoneCodeNotiMessage = "확인되었습니다."
                    
                } else {
                    self?.isPhoneCodeNotiVisible = true
                    self?.phoneCodeNotiMessage = response.message
                }
            }
            .store(in: &self.cancellables)
    }
}

