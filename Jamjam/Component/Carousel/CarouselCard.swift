//
//  CarouselCard.swift
//  Jamjam
//
//  Created by 권형일 on 6/12/25.
//

import Foundation

struct CarouselCard: Identifiable, Hashable {
    var id: UUID = .init()
    
    var image: String
    var title: String
    var subtitle: String
}

var carouselCards: [CarouselCard] = [
    .init(image: "image1", title: "천 공예 장인", subtitle: "김철수"),
    .init(image: "image2", title: "목공 장인", subtitle: "박짱구"),
    .init(image: "image3", title: "그림 장인", subtitle: "이맹구")
]
