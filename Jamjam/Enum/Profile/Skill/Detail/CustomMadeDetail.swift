//
//  CustomMadeDetail.swift
//  Jamjam
//
//  Created by 권형일 on 7/4/25.
//

import Foundation

enum CustomMadeDetail: Int, Codable {
    case customFurniture = 152
    case interiorAccessory = 153
    case accessoryMaking = 154
    case clothingMaking = 155
    case bagMaking = 156
    case cakeMaking = 157
    case bouquet = 158
    case calligraphy = 159
    case illustration = 160
    case characterDesign = 161
    case handmadeCandle = 162
    case soapMaking = 163
    case tarotCardDesign = 164
    case phoneCaseMaking = 165
    case customPerfume = 166

    var displayName: String {
        switch self {
        case .customFurniture: return "맞춤 가구"
        case .interiorAccessory: return "인테리어 소품"
        case .accessoryMaking: return "액세서리 제작"
        case .clothingMaking: return "의류 제작"
        case .bagMaking: return "가방 제작"
        case .cakeMaking: return "케이크 제작"
        case .bouquet: return "꽃다발"
        case .calligraphy: return "캘리그라피"
        case .illustration: return "일러스트 제작"
        case .characterDesign: return "캐릭터 디자인"
        case .handmadeCandle: return "핸드메이드 촛불"
        case .soapMaking: return "비누 제작"
        case .tarotCardDesign: return "타로 카드 디자인"
        case .phoneCaseMaking: return "폰케이스 제작"
        case .customPerfume: return "나만의 향수 제작"
        }
    }
}
