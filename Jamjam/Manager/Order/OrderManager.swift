//
//  OrderManager.swift
//  Jamjam
//
//  Created by 권형일 on 7/13/25.
//

import SwiftUI
import Combine
import Alamofire

class OrderManager {
    static func orderService(_ request: OrderServiceRequestDto, images: [UIImage]?) -> AnyPublisher<OrderServiceResponseDto, Error> {
        return AF.upload(
            multipartFormData: { form in
                if let json = try? JSONEncoder().encode(request) {
                    form.append(json, withName: "request", mimeType: "application/json")
                }
                
                if let images = images {
                    for (index, image) in images.enumerated() {
                        if let data = image.jpegData(compressionQuality: 0.85) {
                            form.append(data, withName: "images", fileName: "image_\(index).jpg", mimeType: "image/jpeg")
                        }
                    }
                }
            },
            to: API.orderService.url,
            method: .post,
            headers: API.headers
        )
        .publishDecodable(type: OrderServiceResponseDto.self)
        .value()
        .mapError { $0 as Error }
        .eraseToAnyPublisher()
    }
}
