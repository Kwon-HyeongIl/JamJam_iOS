//
//  EditUserInfoViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import SwiftUI
import PhotosUI
import Combine
import os

@Observable
class EditUserInfoViewModel {
    var user: UserDomainModel?
    
    var existedProfileImageUrl = ""
    var isNewProfileImagePhotosPickerVisible = false
    var selectedNewProfileImage: PhotosPickerItem?
    var newProfileImage : UIImage?
    var isProfileImageDeleted = false
    
    var nickname = ""
    var isNicknameNotiVisible = false
    var isProgressViewVisibleInNickname = false
    var nicknameNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isNicknameFinalValidated = true
    
    var phoneNumber = ""
    var isPhoneNumberNotiVisible = false
    var phoneNumberNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isProgressViewVisibleInPhoneNumber = false
    var isPhoneNumberSendingButtonTapped = false
    var isPhoneNumberFinalValidated = true
    
    var phoneCode = ""
    var isPhoneCodeNotiVisible = false
    var phoneCodeNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    var isPhoneCodeFinalValidated = true
    
    var newPassword = ""
    var isNewPasswordSecured = true
    var isNewPasswordNotiVisible = false
    var newPasswordNotiMessage = ""
    var isNewPasswordFinalValidated = true
    
    var newConfirmPassword = ""
    var isNewConfirmPasswordSecured = true
    var isNewConfirmPasswordNotiVisible = false
    var newConfirmPasswordNotiMessage = ""
    var isNewConfirmPasswordFinalValidated = true
    
    var bankType: Bank?
    var bankAccount = ""
    var isBankAccountNotiVisible = false
    var bankAccountNotiMessage = ""
    var isBankAccountFinalValidated = true
    
    var isAllValidated: Bool {
        isNicknameFinalValidated && isPhoneNumberFinalValidated && isPhoneCodeFinalValidated && isNewPasswordFinalValidated && isNewConfirmPasswordFinalValidated
    }
    var isEntireProgressViewVisible = false
    var isUpdateCompleted = false
    
    @ObservationIgnored var cancellables = Set<AnyCancellable>()
    @ObservationIgnored let logger = Logger(subsystem: "com.khi.jamjam", category: "EditUserInfoViewModel")
    
    init() {
        fetchUserInfo()
    }
    
    private func fetchUserInfo() {
        UserManager.fetchUserInfo()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[fetchUserInfo] finished")
                case .failure(let error):
                    self?.logger.error("[fetchUserInfo] failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS", let content = response.content {
                    self?.logger.info("[fetchUserInfo] SUCCESS")
                    
                    guard let roleEnum = UserRole(rawValue: content.role),
                          let genderEnum = Gender(rawValue: content.gender) else {
                        self?.logger.error("[fetchUserInfo] roleEnum, genderEnum 변환 실패")
                        return
                    }
                    
                    let accountModel: AccountDomainModel?
                    
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
                    self?.logger.error("[fetchUserInfo] 응답 처리 실패")
                }
            }
            .store(in: &self.cancellables)
    }
    
    func convertThumbnailImage() async {
        guard let item = selectedNewProfileImage else { return }
        
        if let data = try? await item.loadTransferable(type: Data.self),
           let uiImage = UIImage(data: data) {
            await MainActor.run {
                self.newProfileImage = uiImage
            }
            
            isProfileImageDeleted = false
        }
    }
    
    func validateNicknameForm() -> Bool {
        let pattern = "^[가-힣A-Za-z\\d]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: nickname)
    }
    
    func checkNicknameIsDuplicated() {
        let request = CheckNicknameRequestDto(nickname: self.nickname)
        
        UserManager.checkNickname(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[checkNickname] finished")
                case .failure(let error):
                    self?.logger.error("[checkNickname] failed: \(error)")
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
    
    @MainActor
    func restoreNicknameRelated() {
        isNicknameFinalValidated = false
        isNicknameNotiVisible = false
        nicknameNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func validatePhoneNumberForm() -> Bool {
        let pattern = "^010\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self.phoneNumber)
    }
    
    func sendPhoneNumber() {
        let request = SendSmsRequestDto(phoneNumber: phoneNumber)
        
        UserManager.sendSms(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[sendSms] finished")
                case .failure(let error):
                    self?.logger.error("[sendSms] failed: \(error)")
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
    
    @MainActor
    func restorePhoneNumberRelated() {
        isPhoneNumberFinalValidated = false
        isPhoneNumberNotiVisible = false
        phoneNumberNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func verifyPhoneIdentifiedNumber() {
        let request = VerifySmsRequestDto(phoneNumber: self.phoneNumber, code: self.phoneCode)
        
        UserManager.verifySms(request)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[verifySms] finished")
                case .failure(let error):
                    self?.logger.error("[verifySms] failed: \(error)")
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
    
    @MainActor
    func restoreIdentifiedNumberRelated() {
        isPhoneCodeFinalValidated = false
        isPhoneCodeNotiVisible = false
        phoneCodeNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func validateNewPasswordForm() -> Bool {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        
        return predicate.evaluate(with: newPassword)
    }
    
    @MainActor
    func restoreNewPasswordRelated() {
        isNewPasswordFinalValidated = false
        isNewPasswordNotiVisible = false
        newPasswordNotiMessage = ""
    }
    
    func validateNewConfrimPassword() -> Bool {
        return newPassword == newConfirmPassword
    }
    
    @MainActor
    func restoreNewConfirmPasswordRelated() {
        isNewConfirmPasswordFinalValidated = false
        isNewConfirmPasswordNotiVisible = false
        newConfirmPasswordNotiMessage = ""
    }
    
    @MainActor
    func restoreBankAccountRelated() {
        isBankAccountFinalValidated = false
        isBankAccountNotiVisible = false
        bankAccountNotiMessage = "문제가 발생하였습니다. 다시 시도해 주세요."
    }
    
    func updateUserInfo() {
        let request = UpdateUserInfoRequestDto(
            nickname: nickname,
            phoneNumber: phoneNumber,
            password: newPassword.isEmpty ? nil : newPassword,
            account: UpdateUserInfoRequestDto.Account(
                bankCode: (user?.account?.bankCode != bankType?.rawValue) ? bankType?.rawValue : nil,
                bankName: (user?.account?.bankName != bankType?.text) ? bankType?.text : nil,
                accountNumber: (user?.account?.accountNumber != bankAccount) ? bankAccount : nil,
                depositor: (user?.account?.bankCode != bankType?.rawValue) ? user?.name : nil
            ),
            deleteProfileImage: isProfileImageDeleted
        )
        
        UserManager.updateUserInfo(request, newProfileImage: newProfileImage)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.logger.info("[updateUserInfo] completion finished")
                case .failure(let error):
                    self?.logger.error("[updateUserInfo] completion failed: \(error)")
                }
                
                self?.isEntireProgressViewVisible = false
                
            } receiveValue: { [weak self] response in
                if response.code == "SUCCESS" {
                    self?.logger.info("[updateUserInfo] completion finished")
                    self?.isUpdateCompleted = true
                    
                } else {
                    self?.logger.error("[updateUserInfo] 응답 실패: \(response.message)")
                }
            }
            .store(in: &self.cancellables)
    }
}
