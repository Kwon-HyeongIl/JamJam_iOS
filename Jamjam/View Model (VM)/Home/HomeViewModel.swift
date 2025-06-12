//
//  HomeViewModel.swift
//  Jamjam
//
//  Created by 권형일 on 6/12/25.
//

import Foundation

@Observable
class HomeViewModel {
    @ObservationIgnored var carouselCards: [CarouselCard] = [
        .init(image: "image1",),
        .init(image: "image2",),
        .init(image: "image3",)
    ]
}
