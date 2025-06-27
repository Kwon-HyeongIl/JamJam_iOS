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
            let request = SignUpWithProviderRequest(name: self.realName, nickname: self.nickname, loginId: self.loginId, phoneNumber: self.phoneNumber, password: self.password, birth: self.formattedBirthDate, gender: self.gender?.rawValue ?? "NAN")
            
            AuthCenter.shared.signUpWithProvider(request)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("[signUpWithProvider] finished")
                    case .failure(let error):
                        print("[signUpWithProvider] failed: \(error)")
                        self?.isSignUpFailedNoti1 = true
                    }
                } receiveValue: { [weak self] response in
                    if response.code == "SUCCESS" {
                        self?.isSignUpCompleted = true
                        AuthCenter.shared.jwtToken = response.content.accessToken
                        print("완료")
                        print("토큰", AuthCenter.shared.jwtToken)
                        
                    } else {
                        self?.isSignUpFailedNoti2 = true
                        self?.signUpFailedNoti2ErrorMessage = response.message
                    }
                }
                .store(in: &self.cancellables)
            
        } else if self.signUpUserType == .client {
            let request = SignUpWithClientRequest(name: self.realName, nickname: self.nickname, loginId: self.loginId, phoneNumber: self.phoneNumber, password: self.password, birth: self.formattedBirthDate, gender: self.gender?.rawValue ?? "NAN")
            
            AuthCenter.shared.signUpWithClient(request)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("[signUpWithClient] finished")
                    case .failure(let error):
                        print("[signUpWithClient] failed: \(error)")
                        self?.isSignUpFailedNoti1 = true
                    }
                } receiveValue: { [weak self] response in
                    if response.code == "SUCCESS" {
                        self?.isSignUpCompleted = true
                        AuthCenter.shared.jwtToken = response.content.accessToken
                        
                    } else {
                        self?.isSignUpFailedNoti2 = true
                        self?.signUpFailedNoti2ErrorMessage = response.message
                    }
                }
                .store(in: &self.cancellables)
        }
    }
}
