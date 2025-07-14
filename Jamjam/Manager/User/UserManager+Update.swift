//
//  UserManager+Update.swift
//  Jamjam
//
//  Created by 권형일 on 7/10/25.
//

import SwiftUI
import Combine
import Alamofire

extension UserManager {
    static func updateUserInfo(_ request: UpdateUserInfoRequestDto, newProfileImage: UIImage?) -> AnyPublisher<UpdateUserInfoResponseDto, Error> {
        return AF.upload(
            multipartFormData: { form in
                if let json = try? JSONEncoder().encode(request) {
                    form.append(json, withName: "request", mimeType: "application/json")
                }
                
                if let image = newProfileImage,
                   let data = image.jpegData(compressionQuality: 0.85) {
                    form.append(data, withName: "profileUrl", fileName: "profileUrl.jpg", mimeType: "image/jpeg")
                }
            },
            to: API.updateUserInfo.url,
            method: .patch,
            headers: API.headers
        )
        .publishDecodable(type: UpdateUserInfoResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func registerProviderInfo(_ request: UpdateProviderInfoRequestDto) -> AnyPublisher<UpdateProviderInfoResponseDto, Error> {
        return AF.upload(
            multipartFormData: { form in
                if let json = try? JSONEncoder().encode(request) {
                    form.append(json, withName: "request", mimeType: "application/json")
                }
            },
            to: API.updateProviderInfo.url,
            method: .patch,
            headers: API.headers
        )
        .publishDecodable(type: UpdateProviderInfoResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
    
    static func updateProviderInfo(_ request: UpdateProviderInfoRequestDto) -> AnyPublisher<UpdateProviderInfoResponseDto, Error> {
        return AF.upload(
            multipartFormData: { form in
                if let json = try? JSONEncoder().encode(request) {
                    form.append(json, withName: "request", mimeType: "application/json")
                }
            },
            to: API.updateProviderInfo.url,
            method: .patch,
            headers: API.headers
        )
        .publishDecodable(type: UpdateProviderInfoResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
