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
    var isLoginAlertVisible = false
    var loginAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isLoginCompleted = false
    
    func login() {
        let request = LoginRequest(loginId: loginId, password: password)
        
        AuthCenter.shared.login(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[login] finished")
                case .failure(let error):
                    print("[login] failed: \(error)")
                    self?.isLoginAlertVisible = true
                }
                
                self?.isEntireProgressViewVisible = false
                
            } receiveValue: { [weak self] response in
                let receivedAccessToken = response.content?.accessToken ?? ""
                
                if response.message == "SUCCESS", !receivedAccessToken.isEmpty {
                    AuthCenter.shared.accessToken = receivedAccessToken
                    self?.isLoginCompleted = true
                    
                } else {
                    self?.isLoginAlertVisible = true
                    self?.loginAlertMessage = response.message
                }
            }
            .store(in: &self.cancellables)
    }
}
