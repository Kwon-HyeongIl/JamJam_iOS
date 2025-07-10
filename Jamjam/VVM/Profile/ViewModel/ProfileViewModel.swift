//
//  ProfileViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/30/25.
//

import Foundation
import Combine
import os

@Observable
class ProfileViewModel {
    var user: UserDomainModel?
    
    var isUserInit = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "ProfileViewModel")
    
    func fetchUser() {
        UserManager.fetchUser()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchUser] finished")
                case .failure(let error):
                    self?.logger.error("[fetchUser] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchUser] SUCCESS")
                    
                    guard let roleEnum = JJUser(rawValue: content.role),
                          let genderEnum = Gender(rawValue: content.gender) else {
                        self?.logger.error("[fetchUser] roleEnum, genderEnum 변환 실패")
                        return
                    }
                    
                    let accountModel: AccountDomainModel?
                    
                    // 응답으로 온 account가 nil인지 확인
                    if let account = content.account {
                        accountModel = AccountDomainModel(
                            bankCode: account.bankCode,
                            bankName: account.bankName,
                            accountNumber: account.accountNumber,
                            depositor: account.depositor
                        )
                    } else {
                        accountModel = nil
                    }
                    
                    self?.user = UserDomainModel(
                        name: content.name,
                        nickname: content.nickname,
                        phoneNumber: content.phoneNumber,
                        loginId: content.loginId,
                        birth: content.birth,
                        role: roleEnum,
                        gender: genderEnum,
                        profileUrl: content.profileUrl,
                        account: accountModel,
                        credit: content.credit
                    )
                    
                } else {
                    self?.logger.error("[fetchUser] 응답 처리 실패")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func logout() {
        UserManager.logout()
    }
}
