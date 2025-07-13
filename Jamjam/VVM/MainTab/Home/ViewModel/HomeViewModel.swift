//
//  HomeViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/12/25.
//

import Foundation
import Combine
import ShuffleStack

@Observable
class HomeViewModel {
    var isLogin: Bool {
        AuthCore.shared.isLogin
    }
    
    @ObservationIgnored var carouselCards: [CarouselCard] = [
        .init(image: "carousel_image1",),
        .init(image: "carousel_image2",),
        .init(image: "carousel_image3",),
        .init(image: "carousel_image4",)
    ]
    
    @ObservationIgnored var subscriptions = Set<AnyCancellable>()
    
    @ObservationIgnored let shufflePublisher = PassthroughSubject<ShuffleDirection, Never>()
    @ObservationIgnored let timer = Timer.publish(every: 114, on: .main, in: .common)
}
