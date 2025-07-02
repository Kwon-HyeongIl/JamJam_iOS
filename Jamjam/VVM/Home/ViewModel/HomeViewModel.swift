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
        AuthCenter.shared.isLogin
    }
    
    @ObservationIgnored var carouselCards: [CarouselCard] = [
        .init(image: "image1",),
        .init(image: "image2",),
        .init(image: "image3",)
    ]
    
    @ObservationIgnored var subscriptions = Set<AnyCancellable>()
    
    @ObservationIgnored let shufflePublisher = PassthroughSubject<ShuffleDirection, Never>()
    @ObservationIgnored let timer = Timer.publish(every: 3, on: .main, in: .common)
}
