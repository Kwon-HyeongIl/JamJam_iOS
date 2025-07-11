//
//  BeforeCheckPasswordViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import Foundation
import Combine
import os

@Observable
class BeforeCheckPasswordViewModel {
    let user: UserDomainModel?
    
    var currentPassword = ""
    
    var isCurrentPasswordSecured = true
    
    var isCheckPasswordAlertVisible = false
    var checkPasswordAlertMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    
    var isEntireProgressViewVisible = true
    var isCheckPasswordCompleted = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "BeforeCheckPasswordViewModel")
    
    init(user: UserDomainModel?) {
        self.user = user
    }
    
    func checkPassword() {
        let request = CheckPasswordRequestDto(password: currentPassword)
        
        UserManager.checkPassword(request)
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            switch completion {
            case .finished:
                self?.logger.info("[checkPassword] completion finished")
            case .failure(let error):
                self?.logger.error("[checkPassword] completion failed: \(error)")
            }
            
            self?.isEntireProgressViewVisible = false
            self?.isCheckPasswordAlertVisible = true
            
        } receiveValue: { [weak self] response in
            if response.code == "SUCCESS" {
                self?.logger.info("[checkPassword] completion finished")
                self?.isCheckPasswordCompleted = true
                
            } else {
                self?.logger.error("[checkPassword] 응답 실패: \(response.message)")
                self?.isCheckPasswordAlertVisible = true
                self?.checkPasswordAlertMessage = response.message
            }
        }
        .store(in: &self.cancellables)
    }
}
