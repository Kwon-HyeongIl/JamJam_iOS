//
//  TestViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/24/25.
//

import Foundation
import Combine

@Observable
class TestViewModel {
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    
    func request() {
        let request = SignUpWithExpertRequest(name: "김국자", nickname: "ohMyGod", loginId: "onMyLogin", phoneNumber: "01043452839", password: "12345678a@", birth: "1950-06-23", gender: "MALE")
        AuthCenter.shared.signUpWithExpert(request)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("성공")
                case .failure(let error):
                    print("실패", error.localizedDescription)
                }
            } receiveValue: { data in
                print("데이터 출력")
                print(data)
            }
            .store(in: &cancellables)

    }
}
