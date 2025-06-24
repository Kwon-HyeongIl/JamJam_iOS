//
//  AuthCenter+SignUp.swift
//  Jamjam
//
//  Created by 권형일 on 6/24/25.
//

import Foundation
import Combine
import Alamofire

extension AuthCenter {
    func signUpWithExpert(_ request: SignUpWithExpertRequest) -> AnyPublisher<SignUpWithExpertResponse, Error> {
        let url = API.signUpWithExpert.url
        
        return AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: API.headers)
            .validate()
            .publishDecodable(type: SignUpWithExpertResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func signUpWithClient() {
        
    }
}
