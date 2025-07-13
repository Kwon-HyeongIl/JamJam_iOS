//
//  SignUpViewModel+Complete.swift
//  Jamjam
//
//  Created by 권형일 on 6/19/25.
//

import SwiftUI

extension SignUpViewModel {
    func completeSignUp() {
        if self.signUpUserType == .provider {
            self.isEntireProgressViewVisible = true
            
            let request = SignUpWithProviderRequestDto(name: self.realName, nickname: self.nickname, loginId: self.loginId, phoneNumber: self.phoneNumber, password: self.password, birth: self.formattedBirthDate, gender: self.gender?.rawValue ?? "NAN")
            
            UserManager.signUpWithProvider(request)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.logger.info("[signUpWithProvider] finished")
                    case .failure(let error):
                        self?.logger.error("[signUpWithProvider] failed: \(error)")
                        self?.isSignUpAlertVisible = true
                    }
                    
                    self?.isEntireProgressViewVisible = false
                    
                } receiveValue: { [weak self] response in
                    let receivedAccessToken = response.content?.accessToken ?? ""
                    
                    if response.code == "SUCCESS" && !receivedAccessToken.isEmpty {
                        self?.isSignUpCompleted = true
                        AuthCore.shared.accessToken = receivedAccessToken
                        
                    } else {
                        self?.isSignUpAlertVisible = true
                        self?.signUpAlertMessage = response.message
                    }
                }
                .store(in: &self.cancellables)
            
        } else if self.signUpUserType == .client {
            self.isEntireProgressViewVisible = true
            
            let request = SignUpWithClientRequestDto(name: self.realName, nickname: self.nickname, loginId: self.loginId, phoneNumber: self.phoneNumber, password: self.password, birth: self.formattedBirthDate, gender: self.gender?.rawValue ?? "NAN")
            
            UserManager.signUpWithClient(request)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.logger.info("[signUpWithClient] finished")
                    case .failure(let error):
                        self?.logger.error("[signUpWithClient] failed: \(error)")
                        self?.isSignUpAlertVisible = true
                    }
                    
                    self?.isEntireProgressViewVisible = false
                    
                } receiveValue: { [weak self] response in
                    let receivedAccessToken = response.content?.accessToken ?? ""
                    
                    if response.code == "SUCCESS" && !receivedAccessToken.isEmpty {
                        self?.isSignUpCompleted = true
                        AuthCore.shared.accessToken = receivedAccessToken
                        
                    } else {
                        self?.isSignUpAlertVisible = true
                        self?.signUpAlertMessage = response.message
                    }
                }
                .store(in: &self.cancellables)
        }
    }
}
