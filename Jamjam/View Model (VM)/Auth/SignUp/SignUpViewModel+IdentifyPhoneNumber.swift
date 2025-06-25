//
//  SignUpViewModel+IdentifyPhoneNumber.swift
//  Jamjam
//
//  Created by 권형일 on 6/19/25.
//

import Foundation

extension SignUpViewModel {
    func sendPhoneNumber() {
        let request = SendSmsRequest(phoneNumber: self.phoneNumber)
        
        AuthCenter.shared.sendSms(request)
            .map { $0.code }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("[sendSms] finished")
                case .failure(let error):
                    print("[sendSms] failed: \(error)")
                    self?.isPhoneNumberFailedNoti2 = true
                }
            } receiveValue: { [weak self] code in
                if code == "SUCCESS" {
                    self?.isPhoneNumberFinalValidated = true
                }
            }
            .store(in: &self.cancellables)

    }
    
    func verifyPhoneIdentifiedNumber() -> Bool {
        //
        return true
    }
}
