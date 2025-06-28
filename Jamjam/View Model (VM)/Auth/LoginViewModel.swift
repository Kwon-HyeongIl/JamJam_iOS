//
//  LoginViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/16/25.
//

import Foundation
import Combine

@Observable
class LoginViewModel {
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    
    var loginId = ""
    var password = ""
    
    var isEntireProgressViewVisible = false
    var isLoginFailedAlert = false
    var isLoginCompleted = false
    
    func login() {
        let request = LoginRequest(loginId: loginId, password: password)
        
        AuthCenter.shared.login(request)
            .map { $0.accessToken }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[login] finished")
                case .failure(let error):
                    print("[login] failed: \(error)")
                    self?.isLoginFailedAlert = true
                }
                
                self?.isEntireProgressViewVisible = false
                
            } receiveValue: { [weak self] accessToken in
                if !accessToken.isEmpty {
                    AuthCenter.shared.accessToken = accessToken
                    self?.isLoginCompleted = true
                    
                } else {
                    self?.isLoginFailedAlert = true
                }
            }
            .store(in: &self.cancellables)
    }
}
